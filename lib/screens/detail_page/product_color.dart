import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_color_item.dart';
import "package:easy_localization/easy_localization.dart";

class ProductColor extends StatelessWidget {
  const ProductColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('color'),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ProductColorItem(
                itemHeight: 30.0,
                itemWidth: 65.0,
                itemTitle: context.tr('white'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              ProductColorItem(
                itemHeight: 30.0,
                itemWidth: 65.0,
                itemTitle: context.tr('black'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              ProductColorItem(
                itemHeight: 30.0,
                itemWidth: 65.0,
                itemTitle: context.tr('blue'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              ProductColorItem(
                itemHeight: 30.0,
                itemWidth: 70.0,
                itemTitle: context.tr('red'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
