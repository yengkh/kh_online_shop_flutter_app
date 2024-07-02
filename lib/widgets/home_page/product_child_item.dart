import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_item_detail.dart';
import 'dart:math' as math;

class ProductChildItem extends StatefulWidget {
  const ProductChildItem({
    super.key,
    required this.imageUrlString,
    required this.productName,
    required this.productPrice,
    required this.productBrand,
    required this.productRAting,
  });

  @override
  State<ProductChildItem> createState() => _ProductChildItemState();
  final String imageUrlString;
  final String productName;
  final String productPrice;
  final String productBrand;
  final Map<String, dynamic> productRAting;
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
            ProductItemDetail(
              widget: widget,
              productRAting: widget.productRAting,
            ),
          ],
        ),
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline_rounded),
          ),
        ),
        widget.productRAting['discount_rate'] != 0
            ? DiscountBanner(
                discountRate: widget.productRAting['discount_rate'],
              )
            : const SizedBox(),
      ],
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
    required this.discountRate,
  });
  final double discountRate;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -15.0,
      left: -20.0,
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/—Pngtree—trendy sale discount banner_6849275.png',
              height: 120.0,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 40.0,
              left: 30.0,
              child: Text(
                '$discountRate% off',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
