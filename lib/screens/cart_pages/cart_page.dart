import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/material/state_magement/add_to_cart_controller.dart';
import 'package:kh_online_shop_app_flutter/screens/cart_pages/item_text.dart';
import 'package:kh_online_shop_app_flutter/screens/cart_pages/text_button_item.dart';
import "package:easy_localization/easy_localization.dart";

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final AddProductToCart controllerCart = Get.find<AddProductToCart>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('yourCart'),
        ),
      ),
      body: Obx(
        () {
          if (controllerCart.addToCartItem.isEmpty) {
            return Center(child: Text(context.tr('emptyCart')));
          }
          return GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.grey.shade400,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20.0, bottom: 50.0),
              itemCount: controllerCart.addToCartItem.length,
              itemBuilder: (context, index) {
                final product = controllerCart.addToCartItem[index];
                product.totalPrice.value = product.productPrice;
                product.quantity.value = product.productQuantity;
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 160.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100.0,
                            width: 100.0,
                            child: Image.network(product.image),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ItemText(
                                  title: '${context.tr('name')} ',
                                  title2: product.name,
                                ),
                                const SizedBox(height: 3.0),
                                Obx(
                                  () => ItemText(
                                    title: '${context.tr('price')} ',
                                    title2:
                                        '\$${product.totalPrice.value.toStringAsFixed(2)}',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => ItemText(
                                        title: '${context.tr('quantity')} ',
                                        title2:
                                            product.quantity.value.toString(),
                                      ),
                                    ),
                                    const SizedBox(width: 40.0),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controllerCart
                                                .updateDecrement(index);
                                          },
                                          child: const RemoveOrAdd(
                                            iconData: Icons.remove,
                                          ),
                                        ),
                                        const SizedBox(width: 15.0),
                                        GestureDetector(
                                          onTap: () {
                                            controllerCart
                                                .updateIncrement(index);
                                          },
                                          child: const RemoveOrAdd(
                                            iconData: Icons.add,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                ItemText(
                                  title: '${context.tr('brand')} ',
                                  title2: product.productbrand,
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    const SizedBox(width: 15.0),
                                    TextButtonItem(
                                      title: context.tr('remove'),
                                      color: const Color.fromARGB(
                                          255, 206, 36, 75),
                                      onTapEvent: () {
                                        controllerCart.addToCartItem
                                            .removeAt(index);
                                        Get.snackbar(
                                          context.tr('productRemove'),
                                          '${product.name} ${context.tr('removeFromCart')}',
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 30.0),
                                    TextButtonItem(
                                      title: context.tr('checkOut'),
                                      color:
                                          const Color.fromARGB(255, 7, 150, 64),
                                      onTapEvent: () {},
                                    ),
                                  ],
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

class RemoveOrAdd extends StatelessWidget {
  const RemoveOrAdd({
    super.key,
    required this.iconData,
  });
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      width: 35.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(25.0),
        ),
        color: Colors.grey.shade300,
      ),
      child: Icon(
        iconData,
        color: Colors.grey.shade700,
      ),
    );
  }
}
