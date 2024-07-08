import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/models/add_product_to_cart_model.dart';

class AddProductToCart extends GetxController {
  final addToCartItem = <AddProductToCartModel>[].obs;

  var quantity = 1.obs;
  var totalPrice = 0.0.obs;
  var pricee = 0.0.obs;

  increment() {
    quantity.value++;
    totalPrice.value = pricee.value * quantity.value;
    update();
  }

  decrement() {
    if (quantity > 1) {
      quantity.value--;
      totalPrice.value = pricee.value * quantity.value;
      update();
    }
  }

  void addToCart(AddProductToCartModel product) {
    addToCartItem.add(product);
    update();
  }

  void updateIncrement(int index) {
    var product = addToCartItem[index];
    product.quantity.value++;
    product.totalPrice.value = product.productPrice * product.quantity.value;
    update();
  }

  void updateDecrement(int index) {
    var product = addToCartItem[index];
    if (product.quantity.value > 1) {
      product.quantity.value--;
      product.totalPrice.value = product.productPrice * product.quantity.value;
      update();
    }
  }
}
