import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/component/custom_text_form_field.dart';
import 'package:flutter_musinsa_clone/model/user.dart';
import 'package:flutter_musinsa_clone/repository/user_repository.dart';

import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final instance = FirebaseFirestore.instance;
    final userRepository = UserRepository(instance: instance);

    String password = '';
    String id = '';
    String hashedPassword = '';
    String email = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '회원가입',
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
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),
                Column(
                  children: [
                    CustomTextFormField(
                      label: '아이디',
                      hint: '영문, 숫자 5 - 11자',
                      isNecessary: true,
                      isPassword: false,
                      hasLabel: true,
                      onSaved: (value) {
                        id = value;
                      },
                      validator: (value) {
                        id = value;
                        if (value.toString().isEmpty) {
                          return '아이디는 필수 입니다.';
                        }
                        if (!RegExp(r'^[a-zA-Z0-9]{5,11}$').hasMatch(value)) {
                          return '아이디는 영문, 숫자 5 - 11자 입니다.';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var response = await userRepository.getUser(id: id);
                        if (response == null) {
                          if (!mounted) {
                            return;
                          }
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Text('사용할 수 있는 아이디 입니다.'),
                              );
                            },
                          );
                        } else {
                          if (response.id == id) {
                            if (!mounted) {
                              return;
                            }
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('사용할 수 없는 아이디 입니다.'),
                                );
                              },
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size.fromHeight(55),
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        '중복확인',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      label: '비밀번호',
                      hint: '숫자, 영문, 특수문자 조합 최소 8자',
                      isNecessary: true,
                      isPassword: true,
                      hasLabel: true,
                      onSaved: (value) {
                        hashedPassword =
                            sha256.convert(utf8.encode(value)).toString();
                      },
                      validator: (value) {
                        password = value;
                        if (value.toString().isEmpty) {
                          return '비밀번호는 필수 입니다.';
                        }
                        if (!RegExp(
                                r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value)) {
                          return '비밀번호는 숫자, 영문, 특수문자 조합 최소 8자 입니다.';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      label: '비밀번호 재입력',
                      hint: '비밀번호 재입력',
                      isNecessary: true,
                      isPassword: true,
                      hasLabel: false,
                      onSaved: (value) {},
                      validator: (value) {
                        if (password != value && value != '') {
                          return '비밀번호가 일치하지 않습니다.';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                        label: '이메일',
                        hint: '계정 분실 시 본인인증 정보로 활용됩니다.',
                        isNecessary: true,
                        isPassword: false,
                        hasLabel: true,
                        onSaved: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return '이메일은 필수 입니다.';
                          }
                          if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                              .hasMatch(value)) {
                            return '이메일이 아닙니다.';
                          }
                        }),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          var response = await userRepository.getUser(id: id);
                          if (response == null) {
                            final user = User(
                              id: id,
                              password: hashedPassword,
                              email: email,
                            );
                            try {
                              await userRepository.createUser(user: user);
                            } catch (e) {
                              if (!mounted) {
                                return;
                              }
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      content: Text('$e 에러가 발생했습니다.'));
                                },
                              );
                              return;
                            }
                            if (!mounted) {
                              return;
                            }
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomeScreen(),
                              ),
                              (route) => false,
                            );
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('정상적으로 가입되었습니다.'),
                                );
                              },
                            );
                            return;
                          } else {
                            if (response.id == id) {
                              if (!mounted) {
                                return;
                              }
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text('사용할 수 없는 아이디 입니다.'),
                                  );
                                },
                              );
                              return;
                            }
                          }
                        }
                        if (!mounted) {
                          return;
                        }
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text('필수 내용들을 입력해주세요.'),
                            );
                          },
                        );
                        return;
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size.fromHeight(55),
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        '회원가입',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
