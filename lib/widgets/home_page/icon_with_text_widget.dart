import 'package:flutter/material.dart';

class IconWithTextWidget extends StatelessWidget {
  const IconWithTextWidget({
    super.key,
    required this.iconData,
    required this.title,
  });
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        top: 15.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 25.0,
            color: Colors.grey.shade700,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
