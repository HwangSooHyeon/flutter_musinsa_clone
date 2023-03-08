import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_musinsa_clone/model/carousel_page.dart';

class CarouselPageRepository {
  final _dio = Dio();
  final _targetUrl =
      'http://${Platform.isAndroid ? '10.0.2.2' : 'localhost'}:3000/carouselpage';

  Future<List<CarouselPage>> getCarouselPages(
      {required String companyId}) async {
    final response = await _dio.get(
      _targetUrl,
      queryParameters: {
        'companyId': companyId,
      },
    );
    return response.data
        .map<CarouselPage>(
          (x) => CarouselPage.fromJson(
            json: x,
          ),
        )
        .toList();
  }
}
