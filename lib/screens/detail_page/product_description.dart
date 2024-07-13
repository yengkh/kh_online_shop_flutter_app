import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
          Text(
            context.tr('description'),
            style: const TextStyle(fontSize: 18.0),
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
