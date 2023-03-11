import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/provider/carousel_page_provider.dart';
import 'package:flutter_musinsa_clone/repository/carousel_page_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final carouselPageRepository = CarouselPageRepository();
  final carouselPageProvider = CarouselPageProvider(repository: carouselPageRepository);

  test('json 전송 테스트', () async {
    final response =
        await carouselPageRepository.getCarouselPages(companyId: 'musinsa');
    for (var element in response) {
        print(element.toString());
      }
  });
}
