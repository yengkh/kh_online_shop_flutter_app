import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';

class ProductReviewItem extends StatelessWidget {
  const ProductReviewItem({
    super.key,
    required this.productReview,
  });
  final Map<String, dynamic> productReview;
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
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(
          productReview['comment_total'] == 0 ? '' : productReview['title'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          productReview['comment_total'] == 0 ? '' : productReview['content'],
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
