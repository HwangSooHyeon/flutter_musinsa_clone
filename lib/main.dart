import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/provider/carousel_page_provider.dart';
import 'package:flutter_musinsa_clone/repository/carousel_page_repository.dart';
import 'package:flutter_musinsa_clone/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final carouselPageRepository = CarouselPageRepository();
  final carouselPageProvider = CarouselPageProvider(repository: carouselPageRepository);

  runApp(
    ChangeNotifierProvider(
      create: (_) => carouselPageProvider,
      child: MaterialApp(
          home: HomeScreen(),
      ),
    ),
  );
}
