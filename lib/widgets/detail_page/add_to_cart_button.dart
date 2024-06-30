import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 40.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: const Row(
          children: [
            Text("Add To Cart"),
            SizedBox(
              width: 10.0,
            ),
            Icon(Icons.shopping_cart_rounded),
          ],
        ),
      ),
    );
  }
}
