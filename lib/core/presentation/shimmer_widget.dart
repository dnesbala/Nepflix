import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final double? borderRadius;

  const ShimmerWidget(
      {Key? key, required this.height, required this.width, this.borderRadius})
      : super(key: key);

  const ShimmerWidget.rectangular({
    this.width = double.maxFinite,
    required this.height,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          color: Colors.grey,
        ),
      ),
    );
  }
}
