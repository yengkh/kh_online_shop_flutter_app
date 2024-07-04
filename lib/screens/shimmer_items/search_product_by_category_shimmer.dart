import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchProductByCategoryShimmer extends StatelessWidget {
  const SearchProductByCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 200.0,
          child: Shimmer.fromColors(
            period: const Duration(milliseconds: 2000),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  height: 200.0,
                  width: MediaQuery.of(context).size.width - 20.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                );
              },
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
          child: Container(
            height: 40.0,
            width: MediaQuery.of(context).size.width - 80.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Shimmer.fromColors(
          period: const Duration(milliseconds: 2000),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
