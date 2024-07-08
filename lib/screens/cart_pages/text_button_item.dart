import 'package:flutter/material.dart';

class TextButtonItem extends StatelessWidget {
  const TextButtonItem({
    super.key,
    this.onTapEvent,
    required this.color,
    required this.title,
  });

  final Function()? onTapEvent;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          color,
        ),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
      onPressed: onTapEvent,
      child: Text(title),
    );
  }
}
