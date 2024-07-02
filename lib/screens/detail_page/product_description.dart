import 'package:flutter/material.dart';

class DescriptionPath extends StatelessWidget {
  const DescriptionPath({
    super.key,
    required this.productDescription,
  });
  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            productDescription,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
