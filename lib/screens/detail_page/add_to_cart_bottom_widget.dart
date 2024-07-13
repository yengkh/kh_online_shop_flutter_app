import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/widgets/detail_page/add_to_cart_button.dart';
import 'package:kh_online_shop_app_flutter/widgets/detail_page/minus_or_add_widget.dart';

class AddToCartBottomWidget extends StatelessWidget {
  AddToCartBottomWidget({
    super.key,
    required bool isVisible,
    required this.productPrice,
    required this.image,
    required this.brand,
    required this.name,
  }) : _isVisible = isVisible;

  final AddPtoductToCartController addToCart =
      Get.put(AddPtoductToCartController());

  final bool _isVisible;
  final double productPrice;
  final String image;
  final String brand;
  final String name;

  @override
  Widget build(BuildContext context) {
    // Get current theme mode
    final themeMode = AdaptiveTheme.of(context).mode;
    // Determine active color based on theme mode
    final activeColor = themeMode == AdaptiveThemeMode.dark
        ? const Color.fromARGB(255, 156, 42, 69)
        : const Color.fromARGB(255, 206, 36, 75);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isVisible ? 110.0 : 0.0,
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              color: activeColor,
            ),
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 10.0,
              top: 15.0,
            ),
            height: 110.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MinusOrAddWidget(
                  productPrice: productPrice,
                ),
                AddToCartButton(
                  image: image,
                  brand: brand,
                  name: name,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
