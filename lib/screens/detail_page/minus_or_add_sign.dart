import 'package:flutter/material.dart';

class MinusOrAddSign extends StatelessWidget {
  const MinusOrAddSign({
    super.key,
    this.onTapEvent,
    required this.iconsData,
  });
  final IconData iconsData;
  final Function()? onTapEvent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapEvent,
      child: Container(
        height: 35.0,
        width: 35.0,
        decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        child: Center(
          child: Icon(iconsData),
        ),
      ),
    );
  }
}
