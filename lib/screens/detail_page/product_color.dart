import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_color_item.dart';

class ProductColor extends StatelessWidget {
  const ProductColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ProductColorItem(
                itemHeight: 30.0,
                itemWidth: 60.0,
                itemTitle: "White",
              ),
              SizedBox(
                width: 15.0,
              ),
              ProductColorItem(
                itemHeight: 30.0,
                itemWidth: 60.0,
                itemTitle: "Black",
              ),
              SizedBox(
                width: 15.0,
              ),
              ProductColorItem(
                itemHeight: 30.0,
                itemWidth: 60.0,
                itemTitle: "Blue",
              ),
              SizedBox(
                width: 15.0,
              ),
              ProductColorItem(
                itemHeight: 30.0,
                itemWidth: 60.0,
                itemTitle: "Red",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
