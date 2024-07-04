import 'package:flutter/material.dart';

class SizedBoxOfSliver extends StatelessWidget {
  const SizedBoxOfSliver({
    super.key,
    required this.sizedBoxOfSliverHeight,
  });
  final double sizedBoxOfSliverHeight;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: sizedBoxOfSliverHeight,
      ),
    );
  }
}
