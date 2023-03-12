import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/component/custom_icon_button.dart';

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
        CustomIconButton(),
        Container(
          height: 1000,
          color: Colors.amberAccent,
        ),
      ],
    );
  }
}
