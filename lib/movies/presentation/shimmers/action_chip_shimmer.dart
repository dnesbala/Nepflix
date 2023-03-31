import 'package:flutter/material.dart';
import 'package:nepflix/core/presentation/shimmer_widget.dart';

class ActionChipShimmer extends StatelessWidget {
  const ActionChipShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (int _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: ActionChip(
              onPressed: () {},
              label: const ShimmerWidget(
                borderRadius: 30,
                height: 12,
                width: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
