import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomBottomNaviBar extends StatefulWidget {
  final ScrollController scrollController;
  final int currentIndex;

  const CustomBottomNaviBar({
    Key? key,
    required this.scrollController,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNaviBar> createState() => _CustomBottomNaviBarState();
}

class _CustomBottomNaviBarState extends State<CustomBottomNaviBar> {
  bool _isVisible = true;

  void _onItemTapped(int index) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    dispose();
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
      child: Wrap(
        children: [
          BottomNavigationBar(
            elevation: 0,
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
            currentIndex: widget.currentIndex,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
