import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_item_detail.dart';

class ProductChildItem extends StatefulWidget {
  const ProductChildItem({
    super.key,
    required this.imageUrlString,
    required this.productName,
    required this.productPrice,
    required this.productBrand,
    required this.ratingStar,
  });

  @override
  State<ProductChildItem> createState() => _ProductChildItemState();
  final String imageUrlString;
  final String productName;
  final String productPrice;
  final String productBrand;
  final double ratingStar;
}

class _ProductChildItemState extends State<ProductChildItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Image.network(
                  widget.imageUrlString,
                  fit: BoxFit.cover,
                  height: 120.0,
                ),
              ),
            ),
            ProductItemDetail(widget: widget),
          ],
        ),
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline_rounded),
          ),
        ),
      ],
    );
  }
}
