import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_color_item.dart';

class ProductSizePath extends StatelessWidget {
  const ProductSizePath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          ProductColorItem(
            itemHeight: 30.0,
            itemWidth: 40.0,
            itemTitle: 'S',
          ),
          SizedBox(
            width: 15.0,
          ),
          ProductColorItem(
            itemHeight: 30.0,
            itemWidth: 40.0,
            itemTitle: 'M',
          ),
          SizedBox(
            width: 15.0,
          ),
          ProductColorItem(
            itemHeight: 30.0,
            itemWidth: 40.0,
            itemTitle: 'L',
          ),
          SizedBox(
            width: 15.0,
          ),
          ProductColorItem(
            itemHeight: 30.0,
            itemWidth: 40.0,
            itemTitle: 'XL',
          ),
          SizedBox(
            width: 15.0,
          ),
          ProductColorItem(
            itemHeight: 30.0,
            itemWidth: 40.0,
            itemTitle: 'XXL',
          ),
        ],
      ),
    );
  }
}
