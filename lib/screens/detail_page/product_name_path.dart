import 'package:flutter/material.dart';

class BrandNamePath extends StatelessWidget {
  const BrandNamePath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Text(
        "This is product name",
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }
}
