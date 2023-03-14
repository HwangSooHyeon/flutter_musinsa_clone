import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  final ScrollController scrollController;

  const MyScreen({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
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
                onPressed: () {},
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
                onPressed: () {},
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
          ),
        ),
      ),
    );
  }
}