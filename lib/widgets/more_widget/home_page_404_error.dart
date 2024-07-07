import 'package:flutter/material.dart';

class HomePageCarosuel404Error extends StatelessWidget {
  const HomePageCarosuel404Error({
    super.key,
    required this.image,
    this.title,
  });
  final String image;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.right,
        color: Colors.grey.shade400,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              width: MediaQuery.of(context).size.width - 20.0,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      height: 120.0,
                      width: 120.0,
                    ),
                    Text(
                      title ?? '',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
