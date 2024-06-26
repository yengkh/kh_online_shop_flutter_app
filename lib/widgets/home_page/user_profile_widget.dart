import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
    required this.onTapEvent,
  });
  final Function() onTapEvent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
      ),
      child: GestureDetector(
        onTap: onTapEvent,
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.person),
        ),
      ),
    );
  }
}
