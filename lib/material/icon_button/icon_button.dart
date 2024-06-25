import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.iconData,
    this.onPreessEvent,
  });

  final IconData iconData;
  final Function()? onPreessEvent;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPreessEvent,
      icon: Icon(
        iconData,
        size: 25.0,
        color: Colors.grey,
      ),
    );
  }
}
