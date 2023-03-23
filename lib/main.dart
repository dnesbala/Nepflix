import 'package:flutter/material.dart';
import 'package:nepflix/core/infrastructure/shared/app_theme.dart';
import 'package:nepflix/movies/presentation/movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nepflix',
      theme: AppTheme.lightTheme(),
      home: const MovieScreen(),
    );
  }
}
