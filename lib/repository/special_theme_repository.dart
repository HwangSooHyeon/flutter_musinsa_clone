import 'package:dio/dio.dart';
import 'package:flutter_musinsa_clone/model/special_theme.dart';

class SpecialThemeRepository {
  final _dio = Dio();
  final _targetUrl = 'http://localhost:3000/api/get/specialTheme';

  Future<List<SpecialTheme>> getSpecialThemes() async {
    final response = await _dio.get(_targetUrl);
    return response.data
        .map<SpecialTheme>(
          (x) => SpecialTheme.fromJson(
            json: x,
          ),
        )
        .toList();
  }
}
