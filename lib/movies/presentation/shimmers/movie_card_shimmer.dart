import 'package:flutter/material.dart';
import 'package:nepflix/core/presentation/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

class MovieCardShimmer extends StatelessWidget {
  const MovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ShimmerWidget.rectangular(height: 200),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ShimmerWidget.rectangular(height: 16),
              SizedBox(height: 2),
              ShimmerWidget.rectangular(height: 14),
            ],
          ),
        ),
      ],
    );
  }
}
