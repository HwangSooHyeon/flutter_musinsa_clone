import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/component/custom_tab_bar_delegate.dart';
import 'package:flutter_musinsa_clone/component/main_carousel.dart';

import '../const/const.dart';

class HomeWidget extends StatelessWidget {
  final ScrollController scrollController;

  const HomeWidget({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: tabBarLength,
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              title: Text(
                'MUSINSA',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: Colors.white,
              floating: true,
              snap: true,
              elevation: 0,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomTabBarDelegate(),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  Wrap(
                    children: [
                      MainCarousel(),
                      Container(
                        height: 1000,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.redAccent,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.amber,
                  ),
                  Container(
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
