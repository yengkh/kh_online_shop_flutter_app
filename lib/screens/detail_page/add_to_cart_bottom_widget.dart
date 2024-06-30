import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/widgets/detail_page/add_to_cart_button.dart';
import 'package:kh_online_shop_app_flutter/widgets/detail_page/minus_or_add_widget.dart';

class AddToCartBottomWidget extends StatelessWidget {
  const AddToCartBottomWidget({
    super.key,
    required bool isVisible,
  }) : _isVisible = isVisible;

  final bool _isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isVisible ? 60.0 : 0.0,
      child: Wrap(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.amber),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            height: 55.0,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MinusOrAddWidget(),
                AddToCartButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
