import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/repository/carousel_page_repository.dart';

import '../model/carousel_page.dart';

class CarouselPageProvider extends ChangeNotifier {
  final CarouselPageRepository repository;

  Map<String, List<CarouselPage>> cache = {};

  CarouselPageProvider({
    required this.repository,
  });

  void getCarouselPages({
    required String companyId,
  }) async {
    final response = await repository.getCarouselPages(companyId: companyId);
    cache.update(companyId, (value) => response, ifAbsent: () => response);
    notifyListeners();
  }
}
