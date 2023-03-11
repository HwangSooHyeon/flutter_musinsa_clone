import 'package:dio/dio.dart';
import 'package:flutter_musinsa_clone/model/carousel_page.dart';

class CarouselPageRepository {
  final _dio = Dio();
  final _targetUrl = 'http://localhost:3000/api/get/carouselPage';

  Future<List<CarouselPage>> getCarouselPages({
    required String companyId,
  }) async {
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
