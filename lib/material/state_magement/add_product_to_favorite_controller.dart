import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/models/add_product_to_favorite_model.dart';

class AddProductToFavoriteController extends GetxController {
  final productItems = <AddProductToFavoriteModel>[].obs;
  void addToFavorite(AddProductToFavoriteModel products) {
    productItems.add(products);
    update();
  }
}
