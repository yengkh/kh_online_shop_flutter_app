import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

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
            'assets/images/empty_data_icon_149938.webp',
            height: 50.0,
            width: 50.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'No data for now!',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
