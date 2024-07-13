import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kh_online_shop_app_flutter/apis/product_item_api.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';
import 'package:kh_online_shop_app_flutter/models/product_item_model.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/detail_page_from_product_item.dart';
import 'package:kh_online_shop_app_flutter/screens/shimmer_items/home_page_product_item_shimmer.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_child_item.dart';

class HomePageItems extends StatelessWidget {
  const HomePageItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get current theme mode
    final themeMode = AdaptiveTheme.of(context).mode;
    // Determine active color based on theme mode
    final activeColor = themeMode == AdaptiveThemeMode.dark
        ? Colors.grey.shade700
        : Colors.white;
    return FutureBuilder<List<ProductItemModel>>(
      future: ProductItemAPI.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomePageProductitemShimmer();
        } else if (snapshot.hasError) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 5.0,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              childAspectRatio: 0.65,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/error-404.png',
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      context.tr('canNotGetData'),
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return Center(
            child: Text(context.tr('dataNotAvialable')),
          );
        } else {
          final datas = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              childAspectRatio: 0.65,
            ),
            itemCount: datas.length,
            itemBuilder: (BuildContext context, int index) {
              final data = datas[index];
              return Container(
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
                    productPrice: data.price[0]['total_price'].toString(),
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
          );
        }
      },
    );
  }
}
