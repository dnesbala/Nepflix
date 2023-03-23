import 'package:flutter/material.dart';

extension AppExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
}
