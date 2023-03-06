import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_musinsa_clone/component/home_widget.dart';

class CustomBottomNaviBar extends StatefulWidget {
  final ScrollController scrollController;

  const CustomBottomNaviBar({Key? key, required this.scrollController})
      : super(key: key);

  @override
  State<CustomBottomNaviBar> createState() => _CustomBottomNaviBarState();
}

class _CustomBottomNaviBarState extends State<CustomBottomNaviBar> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _isVisible = false;
      });
    }
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: _isVisible ? kBottomNavigationBarHeight : 0.0,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return Expanded(
            child: HomeWidget(
              scrollController: widget.scrollController,
            ),
          );
        },
      ),
    );
  }
}
