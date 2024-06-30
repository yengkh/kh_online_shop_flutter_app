import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/add_to_cart_bottom_widget.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_color.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_description.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_name_path.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_review_path.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/product_size_item.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/seconde_path.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/third_path.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/top_image_path.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_top_products.dart';

class DetailPageFromProductItem extends StatefulWidget {
  const DetailPageFromProductItem({super.key});

  @override
  State<DetailPageFromProductItem> createState() =>
      _DetailPageFromProductItemState();
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
              ),
              const SizedBox(
                height: 20,
              ),
              const SecondePath(),
              const ThirdPath(),
              const BrandNamePath(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Brand Name Here'),
              ),
              const ProductColor(),
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
              const ProductSizePath(),
              const DescriptionPath(),
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
              const ProductReviewPath(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      top: 20.0,
                    ),
                    child: Text(
                      'Similar products you may like',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 250.0,
                    child: HomePageTopProducts(),
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
        isVisible: _isVisible,
      ),
    );
  }
}
