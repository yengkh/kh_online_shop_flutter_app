import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_child_item.dart';
import 'package:kh_online_shop_app_flutter/widgets/text_widget/row_text_widget.dart';

class ProductItemDetail extends StatelessWidget {
  const ProductItemDetail({
    super.key,
    required this.widget,
    required this.productRAting,
  });

  final ProductChildItem widget;

  final Map<String, dynamic> productRAting;

  @override
  Widget build(BuildContext context) {
    // Get current theme mode
    final themeMode = AdaptiveTheme.of(context).mode;
    // Determine active color based on theme mode
    final activeColor =
        themeMode == AdaptiveThemeMode.dark ? Colors.white : Colors.black;
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowTextWidget(
            productName: widget.productName,
            title: '${context.tr('name')} : ',
          ),
          RowTextWidget(
            productName: '\$${widget.productPrice}',
            title: '${context.tr('price')} : ',
            textStyleItems: productRAting['discount_rate'] != 0
                ? const TextStyle(
                    color: Colors.amber,
                  )
                : TextStyle(
                    color: activeColor,
                  ),
          ),
          RowTextWidget(
            productName: widget.productBrand,
            title: '${context.tr('brand')} : ',
          ),
          const SizedBox(
            height: 8.0,
          ),
          productRAting.values.toList().isEmpty
              ? RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 16.0,
                  ignoreGestures: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.grey.shade700,
                  ),
                  onRatingUpdate: (rating) {
                    if (kDebugMode) {
                      print(rating);
                    }
                  },
                )
              : RatingBar.builder(
                  initialRating: widget.productRAting['average_star'],
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 16.0,
                  ignoreGestures: true,
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
