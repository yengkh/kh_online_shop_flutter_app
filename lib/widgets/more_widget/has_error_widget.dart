import 'package:flutter/material.dart';

class HasErrorWidget extends StatelessWidget {
  const HasErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200.0,
          ),
          Image.asset(
            'assets/images/error-icon-4.png',
            height: 50.0,
            width: 50.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Something went wrong!',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
