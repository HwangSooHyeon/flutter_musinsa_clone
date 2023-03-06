import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final ScrollController scrollController;

  const HomeWidget({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        SliverAppBar(
          title: Text('My App'),
          floating: true,
          snap: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Item #$index')),
            childCount: 100,
          ),
        ),
      ],
    );
  }
}
