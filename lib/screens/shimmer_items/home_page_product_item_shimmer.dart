import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageProductitemShimmer extends StatelessWidget {
  const HomePageProductitemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 2000),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 5.0,
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          childAspectRatio: 0.65,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey.shade300,
            ),
          );
        },
      ),
    );
  }
}
