import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/model/special_theme.dart';
import 'package:flutter_musinsa_clone/repository/special_theme_repository.dart';

class SpecialThemeProvider extends ChangeNotifier {
  final SpecialThemeRepository repository;

  List<SpecialTheme> cache = [];

  SpecialThemeProvider({
    required this.repository,
  }) : super() {
    getSpecialThemes();
  }

  void getSpecialThemes() async {
    final response = await repository.getSpecialThemes();
    cache.addAll(response);
    notifyListeners();
  }
}
