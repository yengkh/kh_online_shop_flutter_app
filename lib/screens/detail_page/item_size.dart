import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_color_item.dart';

class ItemSized extends StatelessWidget {
  const ItemSized({
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
            itemTitle: '32',
          ),
          SizedBox(
            width: 15.0,
          ),
          ProductColorItem(
            itemHeight: 30.0,
            itemWidth: 40.0,
            itemTitle: '33',
          ),
          SizedBox(
            width: 15.0,
          ),
          ProductColorItem(
            itemHeight: 30.0,
            itemWidth: 40.0,
            itemTitle: '34',
          ),
          SizedBox(
            width: 15.0,
          ),
          ProductColorItem(
            itemHeight: 30.0,
            itemWidth: 40.0,
            itemTitle: '42',
          ),
          SizedBox(
            width: 15.0,
          ),
          ProductColorItem(
            itemHeight: 30.0,
            itemWidth: 40.0,
            itemTitle: '45',
          ),
        ],
      ),
    );
  }
}
