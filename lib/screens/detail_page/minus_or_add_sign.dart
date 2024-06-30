import 'package:flutter/material.dart';

class MinusOrAddSign extends StatelessWidget {
  const MinusOrAddSign({
    super.key,
    required this.item,
    this.onTapEvent,
  });
  final String item;
  final Function()? onTapEvent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapEvent,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        child: Center(
          child: Text(
            item,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ),
    );
  }
}
