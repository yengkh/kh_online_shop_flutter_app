import 'package:flutter/material.dart';

class SecondePath extends StatelessWidget {
  const SecondePath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.pink,
                size: 25.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("5.0 (120)")
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              size: 25.0,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
