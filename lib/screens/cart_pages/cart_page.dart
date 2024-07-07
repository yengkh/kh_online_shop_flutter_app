import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/material/state_magement/add_to_cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final AddProductToCart controllerCart = Get.find<AddProductToCart>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: TextStyle(color: Colors.grey.shade700),
        ),
      ),
      body: Obx(
        () {
          if (controllerCart.addToCartItem.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }
          return ListView.builder(
            itemCount: controllerCart.addToCartItem.length,
            itemBuilder: (context, index) {
              final product = controllerCart.addToCartItem[index];

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
                                title: 'Name',
                                title2: product.name,
                              ),
                              const SizedBox(height: 3.0),
                              ItemText(
                                title: 'Price',
                                title2:
                                    '\$${controllerCart.totalPrice.value.toStringAsFixed(2)}',
                              ),
                              Row(
                                children: [
                                  ItemText(
                                    title: 'Quantity',
                                    title2: controllerCart.quantity.value
                                        .toString(),
                                  ),
                                  const SizedBox(width: 40.0),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controllerCart.decrement();
                                        },
                                        child: const RemoveOrAdd(
                                          iconData: Icons.remove,
                                        ),
                                      ),
                                      const SizedBox(width: 15.0),
                                      GestureDetector(
                                        onTap: () {
                                          controllerCart.increment();
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
                                title: 'Brand',
                                title2: product.productbrand,
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  const SizedBox(width: 15.0),
                                  TextButtonItem(
                                    title: 'Remove',
                                    color:
                                        const Color.fromARGB(255, 206, 36, 75),
                                    onTapEvent: () {
                                      controllerCart.addToCartItem
                                          .removeAt(index);
                                      Get.snackbar(
                                        'Product Removed',
                                        '${product.name} removed from cart',
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 30.0),
                                  TextButtonItem(
                                    title: 'Check Out',
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
      ),
    );
  }
}

class TextButtonItem extends StatelessWidget {
  const TextButtonItem({
    super.key,
    this.onTapEvent,
    required this.color,
    required this.title,
  });

  final Function()? onTapEvent;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          color,
        ),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
      onPressed: onTapEvent,
      child: Text(title),
    );
  }
}

class ItemText extends StatelessWidget {
  const ItemText({
    super.key,
    required this.title2,
    required this.title,
  });

  final String title2;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title: '),
          Expanded(
            child: Text(
              title2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
