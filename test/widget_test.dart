import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/repository/carousel_page_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final carouselPageRepository = CarouselPageRepository();

  test('json 수신 테스트', () async {
    final response =
        await carouselPageRepository.getCarouselPages(companyId: 'musinsa');
    List<String> actualData = [];
    for(int i = 0; i < response.length; i++) {
      actualData.add(response[i].toString());
    }
    expect(actualData, [
      'id: 1, imgPath: imgPath1, companyId: musinsa',
      'id: 2, imgPath: imgPath2, companyId: musinsa',
      'id: 3, imgPath: imgPath3, companyId: musinsa',
    ]);
  });
}
