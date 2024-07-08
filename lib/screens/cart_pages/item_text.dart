import 'package:flutter/material.dart';

class ItemText extends StatelessWidget {
  const ItemText({
    super.key,
    required this.title2,
    required this.title,
  });

  final String title2;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title: '),
          Expanded(
            child: Text(
              title2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
