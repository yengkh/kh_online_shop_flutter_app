import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    super.key,
    required this.productName,
    required this.title,
    this.textStyleItems,
  });

  final String productName;
  final String title;
  final TextStyle? textStyleItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Expanded(
          child: Text(
            productName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textStyleItems,
          ),
        ),
      ],
    );
  }
}
