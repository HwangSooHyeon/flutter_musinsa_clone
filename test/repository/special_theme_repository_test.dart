import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/repository/special_theme_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final SpecialThemeRepository specialThemeRepository = SpecialThemeRepository();

  test('special theme json 수신 테스트', () async {
    final response = await specialThemeRepository.getSpecialThemes();
    List<String> actualData = [];
    for(int i = 0; i < response.length; i++) {
      actualData.add(response[i].toString());
    }
    expect(actualData, [
      'id: 111, themeName: Boutique, label: 럭셔리, content: 무신사 부티크',
      'id: 112, themeName: Beauty, label: 뷰티, content: 무신사 뷰티',
      'id: 113, themeName: Player, label: 스포츠, content: 무신사 스포츠',
      'id: 114, themeName: Outlet, label: 아울렛, content: 무신사 아울렛',
      'id: 115, themeName: Kids, label: 키즈, content: 무신사 키즈',
      'id: 116, themeName: Golf, label: 골프, content: 무신사 골프',
      'id: 117, themeName: earth, label: 어스, content: 무신사 어스',
      'id: 118, themeName: Spring Outer, label: 봄 아우터, content: 무신사 봄 아우터',
      'id: 119, themeName: Weekend Sale, label: 주말 특가, content: 무신사 주말 특가',
      'id: 120, themeName: 23 S/S PT, label: 봄 신상, content: 무신사 봄 신상',
    ]);
  });
}