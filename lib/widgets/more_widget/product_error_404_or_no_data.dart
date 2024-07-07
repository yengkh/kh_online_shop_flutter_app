import 'package:flutter/material.dart';

class ProductCategoryErrorOrNoData extends StatelessWidget {
  const ProductCategoryErrorOrNoData({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: GridView.builder(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                height: 55.0,
                padding: const EdgeInsets.all(3.0),
                margin: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  bottom: 5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey.shade300,
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 12.0),
              ),
            ],
          );
        },
      ),
    );
  }
}
