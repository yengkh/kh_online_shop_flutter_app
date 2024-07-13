import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_review_item.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/read_more_button.dart';

class ProductReviewPath extends StatelessWidget {
  const ProductReviewPath({
    super.key,
    required this.productReview,
  });
  final Map<String, dynamic> productReview;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productReview['comment_total'] == 0
                ? "${context.tr('review')} (0)"
                : "${context.tr('review')} (${productReview['comment_total']})",
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          productReview['comment_total'] == 0
              ? const SizedBox()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productReview.values.toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductReviewItem(
                      productReview: productReview,
                    );
                  },
                ),
          const SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () {},
            child: ReadMoreButton(
              title: context.tr('writeComment'),
              iconDta: Icons.arrow_drop_down_rounded,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: productReview['comment_total'] == 0
                ? const SizedBox()
                : ReadMoreButton(
                    title: context.tr('viewMore'),
                    iconDta: Icons.arrow_drop_down_rounded,
                  ),
          ),
        ],
      ),
    );
  }
}
