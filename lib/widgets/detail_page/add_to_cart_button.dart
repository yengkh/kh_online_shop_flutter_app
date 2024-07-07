import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/material/state_magement/add_to_cart_controller.dart';
import 'package:kh_online_shop_app_flutter/models/add_product_to_cart_model.dart';

class AddToCartButton extends StatelessWidget {
  AddToCartButton({
    super.key,
    required this.image,
    required this.brand,
    required this.name,
  });
  final String image;
  final String brand;
  final String name;

  final AddProductToCart controllerCart = Get.put(AddProductToCart());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var product = AddProductToCartModel(
          name: name,
          image: image,
          productbrand: brand,
          productPrice: controllerCart.totalPrice.value,
          productQuantity: controllerCart.quantity.value,
        );
        controllerCart.addToCart(product);
        Get.snackbar('Added to Cart', '$name has been added to your cart!');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 40.0,
        width: 250.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
