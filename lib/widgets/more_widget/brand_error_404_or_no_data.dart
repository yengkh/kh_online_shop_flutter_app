import 'package:flutter/material.dart';

class BrandError404OrNoData extends StatelessWidget {
  const BrandError404OrNoData({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.0,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
