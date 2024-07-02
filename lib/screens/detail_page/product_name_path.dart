import 'package:flutter/material.dart';

class BrandNamePath extends StatelessWidget {
  const BrandNamePath({
    super.key,
    required this.productName,
  });
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Name : ',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          Expanded(
            child: Text(
              productName,
              style: const TextStyle(
                fontSize: 18.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
