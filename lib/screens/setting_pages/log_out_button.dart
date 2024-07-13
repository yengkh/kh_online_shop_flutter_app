import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.tr('logOut'),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 15.0,
            ),
            const Icon(Icons.logout_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
