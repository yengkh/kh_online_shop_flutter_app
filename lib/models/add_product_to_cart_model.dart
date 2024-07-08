import 'package:get/get.dart';

class AddProductToCartModel {
  String name;
  String image;
  String productbrand;
  double productPrice;
  int productQuantity;
  AddProductToCartModel({
    required this.name,
    required this.image,
    required this.productbrand,
    required this.productPrice,
    required this.productQuantity,
  });

  var quantity = 1.obs;
  var totalPrice = 0.0.obs;
}
