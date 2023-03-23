import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/model/user.dart';
import 'package:flutter_musinsa_clone/screen/home_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignedInScreen extends StatefulWidget {
  final String userInfo;
  final FlutterSecureStorage secureStorage;

  const SignedInScreen({
    Key? key,
    required this.userInfo,
    required this.secureStorage,
  }) : super(key: key);

  @override
  State<SignedInScreen> createState() => _SignedInScreenState();
}

class _SignedInScreenState extends State<SignedInScreen> {
  late final User user;

  @override
  void initState() {
    super.initState();
    user = User.fromJson(
      json: jsonDecode(widget.userInfo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('${user.id}'),
        Text('${user.password}'),
        Text('${user.email}'),
        ElevatedButton(
          onPressed: () async {
            await widget.secureStorage.delete(key: 'signIn');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            );
          },
          child: Text('로그아웃'),
        ),
      ],
    );
  }
}
