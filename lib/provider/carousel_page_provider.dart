import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/repository/carousel_page_repository.dart';

class CarouselPageProvider extends ChangeNotifier {
  final CarouselPageRepository repository;

  CarouselPageProvider({
    required this.repository,
  });

  void getCarouselPages({required String companyId}) async {
    final response = await repository.getCarouselPages(companyId: companyId);
    notifyListeners();
  }
}
