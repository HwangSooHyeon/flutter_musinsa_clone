import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/screen/sign_in_screen.dart';
import 'package:flutter_musinsa_clone/screen/sign_up_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UnsignedInScreen extends StatelessWidget {
  final FlutterSecureStorage secureStorage;

  const UnsignedInScreen({
    Key? key,
    required this.secureStorage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        Text(
          '아직 무신사 회원이 아니신가요?',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          '회원만의 특별한 혜택을 누려보세요!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SignUpScreen(),
              ),
            );
          },
          child: Text(
            '회원가입',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Colors.black,
            ),
            minimumSize: Size.fromHeight(55),
          ),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SignInScreen(
                  secureStorage: secureStorage,
                ),
              ),
            );
          },
          child: Text(
            '로그인',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size.fromHeight(55),
            backgroundColor: CupertinoColors.systemBlue,
          ),
        ),
      ],
    );
  }
}
