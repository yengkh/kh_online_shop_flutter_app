import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/apis/get_product_by_pagination.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';
import 'package:kh_online_shop_app_flutter/models/product_item_model.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/detail_page_from_product_item.dart';
import 'package:kh_online_shop_app_flutter/screens/shimmer_items/home_page_product_item_shimmer.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_child_item.dart';

class HomePageItemByPagination extends StatefulWidget {
  const HomePageItemByPagination({super.key});

  @override
  State<HomePageItemByPagination> createState() =>
      _HomePageItemByPaginationState();
}

class _HomePageItemByPaginationState extends State<HomePageItemByPagination> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductItemModel>>(
      future: GetProductByPagination.getProductByPagination(page: 1, limit: 10),
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
                    const Text(
                      'Cannot get data!',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No data available'),
          );
        } else {
          final datas = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              childAspectRatio: 0.65,
            ),
            itemCount: datas.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < datas.length) {
                final data = datas[index];
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
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
              } else {
                return null;
              }
            },
          );
        }
      },
    );
  }
}
