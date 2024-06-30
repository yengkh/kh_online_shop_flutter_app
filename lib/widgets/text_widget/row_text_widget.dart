import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    super.key,
    required this.productName,
    required this.title,
  });

  final String productName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Text(productName),
      ],
    );
  }
}
