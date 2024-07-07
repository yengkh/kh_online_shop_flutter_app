import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/add_to_cart_bottom_widget.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/item_size.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_color.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_description.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_name_path.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_review_path.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_size_item.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/seconde_path.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/third_path.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/top_image_path.dart';
import 'package:kh_online_shop_app_flutter/widgets/detail_page/similar_product.dart';

class DetailPageFromProductItem extends StatefulWidget {
  const DetailPageFromProductItem({
    super.key,
    required this.imageData,
    required this.productName,
    required this.brandName,
    required this.productDescription,
    required this.productPrice,
    required this.productRating,
    required this.productReview,
    required this.productType,
    required this.productQuantity,
  });

  @override
  State<DetailPageFromProductItem> createState() =>
      _DetailPageFromProductItemState();
  final Map<String, dynamic> imageData;
  final String productName;
  final String brandName;
  final String productDescription;
  final Map<String, dynamic> productPrice;
  final Map<String, dynamic> productRating;
  final Map<String, dynamic> productReview;
  final String productType;
  final int productQuantity;
}

int _currentActiveIndex = 0;

class _DetailPageFromProductItemState extends State<DetailPageFromProductItem> {
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isVisible) setState(() => _isVisible = false);
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isVisible) setState(() => _isVisible = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.grey.shade400,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopImagePath(
                currentActiveIndex: _currentActiveIndex,
                allImageData: widget.imageData,
              ),
              const SizedBox(
                height: 20,
              ),
              SecondePath(
                productRating: widget.productRating,
              ),
              ThirdPath(
                productPrice: widget.productPrice,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                child: Row(
                  children: [
                    widget.productQuantity != 0
                        ? Text(
                            'In Stock : ',
                            style: TextStyle(color: Colors.green.shade700),
                          )
                        : Text(
                            'Out Of Stock',
                            style: TextStyle(color: Colors.red.shade700),
                          ),
                    widget.productQuantity != 0
                        ? Text('${widget.productQuantity} Items Left')
                        : const Text(''),
                  ],
                ),
              ),
              BrandNamePath(
                productName: widget.productName,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Text(
                      'Brand : ',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      widget.brandName,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const ProductColor(),
              widget.productType.toLowerCase() == 'sport' ||
                      widget.productType.toLowerCase() == 'electronic' ||
                      widget.productType.toLowerCase() == 'cosmetic' ||
                      widget.productType.toLowerCase() == 'sun-glasses' ||
                      widget.productType.toLowerCase() == 'travel-kit'
                  ? const SizedBox()
                  : SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'Size',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          widget.productType.toLowerCase() == "sneaker"
                              ? const ItemSized()
                              : const ProductSizePath(),
                        ],
                      ),
                    ),
              DescriptionPath(
                productDescription: widget.productDescription,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 20.0,
                ),
                child: Divider(
                  color: Colors.grey.shade600,
                  height: 2.0,
                ),
              ),
              ProductReviewPath(
                productReview: widget.productReview,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      top: 20.0,
                    ),
                    child: Text(
                      'Similar products you may like',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SimilarProduct(
                    productType: widget.productType,
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddToCartBottomWidget(
        productPrice: widget.productPrice['total_price'],
        isVisible: _isVisible,
        brand: widget.brandName,
        image: widget.imageData['other_color_one'],
        name: widget.productName,
      ),
    );
  }
}
