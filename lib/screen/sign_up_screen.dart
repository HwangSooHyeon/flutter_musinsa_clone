import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/component/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _password = '';

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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 8),
              Column(
                children: [
                  CustomTextFormField(
                    label: '아이디',
                    hint: '영문, 숫자 5 - 11자',
                    isNecessary: true,
                    isPassword: false,
                    hasLabel: true,
                    onSaved: (value) {},
                    validator: (value) {
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: '비밀번호',
                    hint: '숫자, 영문, 특수문자 조합 최소 8자',
                    isNecessary: true,
                    isPassword: true,
                    hasLabel: true,
                    onSaved: (value) {},
                    validator: (value) {
                      _password = value;
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
                      if (_password != value && value != '') {
                        return '비밀번호가 일치하지 않습니다.';
                      }
                    },
                  ),
                  CustomTextFormField(
                      label: '이메일',
                      hint: '계정 분실 시 본인인증 정보로 활용됩니다.',
                      isNecessary: true,
                      isPassword: false,
                      hasLabel: true,
                      onSaved: (value) {},
                      validator: (value) {}),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: Size.fromHeight(55),
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
