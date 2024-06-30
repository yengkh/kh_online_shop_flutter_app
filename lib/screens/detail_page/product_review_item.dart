import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';

class ProductReviewItem extends StatelessWidget {
  const ProductReviewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          boxShadowWidget(),
        ],
      ),
      child: const ListTile(
        leading: Icon(Icons.person),
        title: Text(
          "This is comment",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          "Our classic T-Shirt is the perfect blend of style, comfort, and durability. Crafted from 100% premium cotton, this shirt offers a soft and breathable feel,",
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
