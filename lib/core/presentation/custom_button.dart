import 'package:flutter/material.dart';

import 'package:nepflix/core/shared/app_extensions.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final Color? bgColor;
  final double? radius;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.bgColor = Colors.pink,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Text(
          title,
          style: context.textTheme.headline6!.copyWith(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
      ),
    );
  }
}
