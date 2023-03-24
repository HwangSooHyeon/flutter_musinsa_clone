import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/component/custom_text_form_field.dart';
import 'package:flutter_musinsa_clone/repository/user_repository.dart';
import 'package:flutter_musinsa_clone/screen/home_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInScreen extends StatefulWidget {
  final FlutterSecureStorage secureStorage;

  const SignInScreen({
    Key? key,
    required this.secureStorage,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String id = '';
    String password = '';
    final instance = FirebaseFirestore.instance;
    final userRepository = UserRepository(instance: instance);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '로그인',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          splashRadius: 0.1,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                label: '아이디',
                hint: '아이디',
                isNecessary: false,
                isPassword: false,
                hasLabel: false,
                onSaved: (value) {
                  id = value;
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return '아이디를 입력하세요.';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                label: '비밀번호',
                hint: '비밀번호',
                isNecessary: false,
                isPassword: true,
                hasLabel: false,
                onSaved: (value) {
                  password = sha256.convert(utf8.encode(value)).toString();
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return '비밀번호를 입력하세요.';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var response = await userRepository.getUser(id: id);
                    if (response == null) {
                      if (!mounted) return;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('아이디 혹은 비밀번호가 일치하지 않습니다.'),
                          );
                        },
                      );
                      return;
                    }
                    if (response.password == password) {
                      String userInfo = jsonEncode(
                        response.toJson(),
                      );
                      await widget.secureStorage.write(
                        key: 'signIn',
                        value: userInfo,
                      );
                      if (!mounted) return;
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                      return;
                    } else {
                      if (!mounted) return;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('아이디 혹은 비밀번호가 일치하지 않습니다.'),
                          );
                        },
                      );
                      return;
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size.fromHeight(55),
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  '로그인',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
