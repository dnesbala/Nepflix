import 'package:flutter/material.dart';
import 'package:nepflix/core/presentation/shimmer_widget.dart';
import 'package:nepflix/core/shared/app_extensions.dart';

class NowPlayingMovieCardShimmer extends StatelessWidget {
  const NowPlayingMovieCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ShimmerWidget.rectangular(
            height: 170,
            width: context.deviceWidth * 0.8,
          ),
        ],
      ),
    );
  }
}
