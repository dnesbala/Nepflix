import 'package:flutter/material.dart';

class AppTheme {
  static const lightThemeTextColor = Colors.black;
  static const darkThemeTextColor = Colors.white;

  static ThemeData baseTheme() {
    return ThemeData(
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: lightThemeTextColor,
        ),
        headline2: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: lightThemeTextColor,
        ),
        headline3: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
          color: lightThemeTextColor,
        ),
        headline4: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: lightThemeTextColor,
        ),
        headline5: TextStyle(
          fontSize: 16,
          color: lightThemeTextColor,
        ),
        headline6: TextStyle(
          fontSize: 14,
          color: lightThemeTextColor,
        ),
      ),
    );
  }

  static ThemeData lightTheme() {
    return baseTheme().copyWith(
      scaffoldBackgroundColor: Colors.grey.shade100,
    );
  }

  static ThemeData darkTheme() {
    return baseTheme().copyWith(
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: darkThemeTextColor,
        ),
        headline2: TextStyle(
          color: darkThemeTextColor,
        ),
        headline3: TextStyle(
          color: darkThemeTextColor,
        ),
        headline4: TextStyle(
          color: darkThemeTextColor,
        ),
        headline5: TextStyle(
          color: darkThemeTextColor,
        ),
        headline6: TextStyle(
          color: darkThemeTextColor,
        ),
      ),
    );
  }
}
