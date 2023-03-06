import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/component/custom_bottom_navi_bar.dart';
import 'package:flutter_musinsa_clone/component/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      body: CustomBottomNaviBar(
        scrollController: scrollController,
      ),
    );
  }
}
