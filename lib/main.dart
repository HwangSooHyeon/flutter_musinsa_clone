import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/provider/carousel_page_provider.dart';
import 'package:flutter_musinsa_clone/provider/special_theme_provider.dart';
import 'package:flutter_musinsa_clone/repository/carousel_page_repository.dart';
import 'package:flutter_musinsa_clone/repository/special_theme_repository.dart';
import 'package:flutter_musinsa_clone/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final carouselPageRepository = CarouselPageRepository();
  final specialThemeRepository = SpecialThemeRepository();

  final carouselPageProvider =
      CarouselPageProvider(repository: carouselPageRepository);
  final specialThemeProvider =
      SpecialThemeProvider(repository: specialThemeRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => carouselPageProvider),
        ChangeNotifierProvider(create: (_) => specialThemeProvider),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}
