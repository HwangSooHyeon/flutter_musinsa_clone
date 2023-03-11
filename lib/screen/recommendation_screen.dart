import 'package:flutter/material.dart';

import '../component/main_carousel.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        MainCarousel(),
        Container(
          height: 1000,
          color: Colors.amber,
        ),
        Container(
          height: 1000,
          color: Colors.amberAccent,
        ),
      ],
    );
  }
}
