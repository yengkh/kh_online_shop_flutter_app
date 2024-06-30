import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_review_item.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/read_more_button.dart';

class ProductReviewPath extends StatelessWidget {
  const ProductReviewPath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Reviews (150)",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return const ProductReviewItem();
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () {},
            child: const ReadMoreButton(),
          ),
        ],
      ),
    );
  }
}
