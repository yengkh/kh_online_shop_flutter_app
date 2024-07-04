import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmer extends StatelessWidget {
  const HomePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 2000),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 5.0),
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 18.0,
            width: MediaQuery.of(context).size.width - 20.0,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
