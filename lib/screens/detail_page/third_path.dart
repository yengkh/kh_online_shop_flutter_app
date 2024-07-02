import 'package:flutter/material.dart';

class ThirdPath extends StatelessWidget {
  const ThirdPath({
    super.key,
    required this.productPrice,
  });
  final Map<String, dynamic> productPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          productPrice['discount_rate'] != 0
              ? PromotionBanner(
                  discontRate: "${productPrice['discount_rate']}% off",
                )
              : const SizedBox(),
          const SizedBox(
            width: 10.0,
          ),
          productPrice['discount_rate'] != 0
              ? TextItem(
                  title: "${productPrice['default_price']}\$",
                )
              : const SizedBox(),
          productPrice['discount_rate'] != 0
              ? const TextItem(
                  title: ' To ',
                )
              : const SizedBox(),
          TextItem(
            title: "${productPrice['total_price']}\$",
          ),
        ],
      ),
    );
  }
}

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({
    super.key,
    required this.discontRate,
  });
  final String discontRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(discontRate),
    );
  }
}

class TextItem extends StatelessWidget {
  const TextItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
