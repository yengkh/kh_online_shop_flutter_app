import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageBrandShimmer extends StatelessWidget {
  const HomePageBrandShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 2000),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 10.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 60.0,
            width: 100.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
