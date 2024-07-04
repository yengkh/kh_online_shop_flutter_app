import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchProductByBraandShimmer extends StatelessWidget {
  const SearchProductByBraandShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Shimmer.fromColors(
          period: const Duration(milliseconds: 2000),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Shimmer.fromColors(
          period: const Duration(milliseconds: 2000),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 40.0,
            width: MediaQuery.of(context).size.width - 50.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Shimmer.fromColors(
          period: const Duration(milliseconds: 2000),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.65,
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
