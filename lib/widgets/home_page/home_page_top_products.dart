import 'package:flutter/material.dart';

class HomePageTopProducts extends StatelessWidget {
  const HomePageTopProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.right,
        color: Colors.pink.shade300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                height: 200,
                width: 150.0,
                decoration: const BoxDecoration(color: Colors.amber),
              ),
            );
          },
        ),
      ),
    );
  }
}
