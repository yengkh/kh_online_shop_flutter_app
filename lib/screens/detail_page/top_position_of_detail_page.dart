import 'package:flutter/material.dart';

class TopPositionOfDetailPage extends StatelessWidget {
  const TopPositionOfDetailPage({
    super.key,
    this.leftPosition,
    this.rightPosition,
    required this.childOfItem,
    this.onTapEvent,
    this.bottomPosition,
  });
  final double? leftPosition;
  final double? rightPosition;
  final double? bottomPosition;
  final Widget childOfItem;
  final Function()? onTapEvent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25.0,
      left: leftPosition,
      right: rightPosition,
      bottom: bottomPosition,
      child: GestureDetector(
        onTap: onTapEvent,
        child: SizedBox(
          height: 40.0,
          width: 40.0,
          child: Center(
            child: childOfItem,
          ),
        ),
      ),
    );
  }
}
