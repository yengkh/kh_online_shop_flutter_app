import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kh_online_shop_app_flutter/material/state_magement/add_to_cart_controller.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/minus_or_add_sign.dart';

// ignore: must_be_immutable
class MinusOrAddWidget extends StatelessWidget {
  MinusOrAddWidget({
    super.key,
    required this.productPrice,
  });
  final double productPrice;
  final AddProductToCart addProductTo = Get.put(AddProductToCart());

  @override
  Widget build(BuildContext context) {
    addProductTo.totalPrice.value = productPrice;
    addProductTo.pricee.value = productPrice;
    addProductTo.quantity.value = 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'Total Price : ',
              //style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            Obx(() => Text(
                  "\$${addProductTo.totalPrice.value.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                )),
          ],
        ),
        Row(
          children: [
            MinusOrAddSign(
              onTapEvent: () => addProductTo.decrement(),
              iconsData: Icons.remove,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Obx(() => Text(
                  addProductTo.quantity.value.toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                )),
            const SizedBox(
              width: 8.0,
            ),
            MinusOrAddSign(
              onTapEvent: () => addProductTo.increment(),
              iconsData: Icons.add,
            ),
          ],
        ),
      ],
    );
  }
}

class AddPtoductToCartController {}
