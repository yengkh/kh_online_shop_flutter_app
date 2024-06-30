import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_child_item.dart';
import 'package:kh_online_shop_app_flutter/widgets/text_widget/row_text_widget.dart';

class ProductItemDetail extends StatelessWidget {
  const ProductItemDetail({
    super.key,
    required this.widget,
  });

  final ProductChildItem widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowTextWidget(
            productName: widget.productName,
            title: 'Name : ',
          ),
          RowTextWidget(
            productName: widget.productPrice,
            title: 'Price : ',
          ),
          RowTextWidget(
            productName: widget.productBrand,
            title: 'Brand : ',
          ),
          const SizedBox(
            height: 8.0,
          ),
          RatingBar.builder(
            initialRating: widget.ratingStar,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 16.0,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.pink,
            ),
            onRatingUpdate: (rating) {
              if (kDebugMode) {
                print(rating);
              }
            },
          ),
        ],
      ),
    );
  }
}
