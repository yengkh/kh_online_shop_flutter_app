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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log Out',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 15.0,
            ),
            Icon(Icons.logout_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
