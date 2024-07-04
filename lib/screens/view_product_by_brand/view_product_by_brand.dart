import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kh_online_shop_app_flutter/apis/search_product_by_brand_api.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';
import 'package:kh_online_shop_app_flutter/models/product_item_model.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/detail_page_from_product_item.dart';
import 'package:kh_online_shop_app_flutter/screens/shimmer_items/search_product_by_brand_shimmer.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_child_item.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/arrow_back_widget.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/has_error_widget.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/no_data_widget.dart';

class ViewProductByBrand extends StatefulWidget {
  const ViewProductByBrand({
    super.key,
    required this.brand,
    required this.brandImage,
  });

  @override
  State<ViewProductByBrand> createState() => _ViewProductByBrandState();
  final String brand;
  final String brandImage;
}

class _ViewProductByBrandState extends State<ViewProductByBrand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackWidget(),
        title: Text(widget.brand),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
          ),
          const SizedBox(
            width: 5.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<ProductItemModel>>(
          future: SearchProductByBrandApi.getProductByBrand(widget.brand),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SearchProductByBraandShimmer();
            } else if (snapshot.hasError) {
              return const HasErrorWidget();
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const NoDataWidget();
            } else {
              final datas = snapshot.data!;
              return Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    height: 200.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        widget.brandImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Find The relate products ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.65,
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                    ),
                    itemCount: datas.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                    'default_price': data.price[0]
                                        ['default_price'],
                                    'discount_rate': data.price[0]
                                        ['discount_rate'],
                                    'discount_price': data.price[0]
                                        ['discount_price'],
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
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
