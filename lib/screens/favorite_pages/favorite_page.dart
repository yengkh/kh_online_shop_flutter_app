import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/material/state_magement/add_product_to_favorite_controller.dart';
import 'package:kh_online_shop_app_flutter/screens/cart_pages/item_text.dart';
import 'package:kh_online_shop_app_flutter/screens/cart_pages/text_button_item.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final AddProductToFavoriteController controllerFavorite =
      Get.find<AddProductToFavoriteController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite Product",
          style: TextStyle(color: Colors.grey.shade700),
        ),
      ),
      body: Obx(
        () {
          if (controllerFavorite.productItems.isEmpty) {
            return const Center(child: Text('Your favorite is empty.'));
          }
          return GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.grey.shade400,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20.0, bottom: 50.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: controllerFavorite.productItems.length,
              itemBuilder: (BuildContext context, int index) {
                final product = controllerFavorite.productItems[index];
                return Card(
                  child: SizedBox(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 100.0,
                            width: 100.0,
                            child: Image.network(product.image),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                ItemText(
                                  title: 'Name ',
                                  title2: product.name,
                                ),
                                ItemText(
                                  title: 'Price ',
                                  title2:
                                      '\$${product.price.toStringAsFixed(2)}',
                                ),
                                ItemText(
                                  title: 'Brand ',
                                  title2: product.brand,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButtonItem(
                                        color: const Color.fromARGB(
                                            255, 206, 36, 75),
                                        title: 'Remove',
                                        onTapEvent: () => controllerFavorite
                                            .productItems
                                            .removeAt(index),
                                      ),
                                      TextButtonItem(
                                        color: const Color.fromARGB(
                                            255, 7, 150, 64),
                                        title: 'Add To Cart',
                                        onTapEvent: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
