import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageCategoryShimmer extends StatelessWidget {
  const HomePageCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 2000),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  bottom: 5.0,
                ),
                height: 55.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                height: 15.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
