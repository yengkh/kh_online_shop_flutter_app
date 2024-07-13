import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/apis/search_product_by_type_api.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';
import 'package:kh_online_shop_app_flutter/models/product_item_model.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/detail_page_from_product_item.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_child_item.dart';

class SimilarProduct extends StatefulWidget {
  const SimilarProduct({
    super.key,
    required this.productType,
  });
  final String productType;

  @override
  State<SimilarProduct> createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  List<ProductItemModel>? _items;
  bool _isLoading = true;

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future<void> _fetchData() async {
    try {
      List<ProductItemModel> items =
          await SearchProductByTypeApi.getProduct(widget.productType);
      setState(() {
        _items = items;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get current theme mode
    final themeMode = AdaptiveTheme.of(context).mode;
    // Determine active color based on theme mode
    final activeColor = themeMode == AdaptiveThemeMode.dark
        ? Colors.grey.shade700
        : Colors.white;
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_items == null || _items!.isEmpty) {
      return const Center(
        child: Text('No Data!'),
      );
    } else {
      final datas = _items!;
      return SizedBox(
        height: 270.0,
        width: MediaQuery.of(context).size.width,
        child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.right,
          color: Colors.grey.shade400,
          child: ListView.builder(
            padding: const EdgeInsets.all(5.0),
            scrollDirection: Axis.horizontal,
            itemCount: _items!.length,
            itemBuilder: (BuildContext context, int index) {
              final data = datas[index];
              return Container(
                height: 270.0,
                width: 150.0,
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: activeColor,
                  boxShadow: [
                    boxShadowWidget(),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => DetailPageFromProductItem(
                        productQuantity: data.productQuantity,
                        imageData: data.images[0],
                        productPrice: data.price[0],
                        productName: data.name,
                        brandName: data.productBrand,
                        productDescription: data.detail,
                        productRating: data.rating.isEmpty
                            ? {
                                'average_star': 0.0,
                              }
                            : data.rating[0],
                        productReview: data.comment.isEmpty
                            ? {
                                'comment_total': 0,
                              }
                            : data.comment[0],
                        productType: data.productType,
                      ),
                    );
                  },
                  child: ProductChildItem(
                    imageUrlString: data.images.isNotEmpty &&
                            data.images[0]['other_color_one'] != null
                        ? data.images[0]['other_color_one']
                        : data.images[0]['other_color_two'],
                    productName: data.name,
                    productPrice:
                        '${data.price[0]['total_price'].toString()} \$',
                    productBrand: data.productBrand,
                    productRAting: data.price.isEmpty
                        ? {
                            'default_price': 0.0,
                            'discount_rate': 0.0,
                            'discount_price': 0.0,
                            'total_price': 0.0,
                            'average_star': 0.0,
                          }
                        : {
                            'default_price': data.price[0]['default_price'],
                            'discount_rate': data.price[0]['discount_rate'],
                            'discount_price': data.price[0]['discount_price'],
                            'total_price': data.price[0]['total_price'],
                            'average_star': data.rating.isEmpty
                                ? 0.0
                                : data.rating[0]['average_star'],
                          },
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
