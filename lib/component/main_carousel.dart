import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/provider/carousel_page_provider.dart';
import 'package:provider/provider.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({Key? key}) : super(key: key);

  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      Duration(
        seconds: 3,
      ),
      (timer) {
        int? nextPage = pageController.page?.toInt();

        if (nextPage == null) return;
        nextPage++;
        if (nextPage > 2) nextPage = 0;
        print('page number: $nextPage');
        pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CarouselPageProvider>();
    final companyId = 'musinsa';
    final carouselPages = provider.cache[companyId] ?? [];

    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: PageView(
        controller: pageController,
        children: carouselPages
            .map(
              (page) => Container(
                alignment: Alignment.center,
                child: Text(page.imgPath),
              ),
            )
            .toList(),
      ),
    );
  }
}
