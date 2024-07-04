import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kh_online_shop_app_flutter/apis/search_product_by_type_api.dart';
import 'package:kh_online_shop_app_flutter/material/product_type_image/product_type_image.dart';
import 'package:kh_online_shop_app_flutter/models/product_item_model.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/detail_page_from_product_item.dart';
import 'package:kh_online_shop_app_flutter/screens/shimmer_items/search_product_by_category_shimmer.dart';
import 'package:kh_online_shop_app_flutter/screens/view_product_by_type/image_carosuel.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_child_item.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/arrow_back_widget.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/has_error_widget.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/no_data_widget.dart';

class ViewProductByType extends StatefulWidget {
  const ViewProductByType({
    super.key,
    required this.productType,
  });

  @override
  State<ViewProductByType> createState() => _ViewProductByTypeState();
  final String productType;
}

class _ViewProductByTypeState extends State<ViewProductByType> {
  final ValueNotifier<int> _pageIndexNotifier = ValueNotifier<int>(0);
  get productType => widget.productType;
  late List<String> imageListWillShow;

  void checkType() {
    if (productType == 'Man' ||
        productType == 'Woman' ||
        productType == 'Shirt' ||
        productType == 'Jean' ||
        productType == 'T-Shirt') {
      imageListWillShow = ProductTypeImage.shirtImages;
    } else if (productType == 'Electronic') {
      imageListWillShow = ProductTypeImage.electronicImage;
    } else if (productType == 'Sneaker') {
      imageListWillShow = ProductTypeImage.sneakerImages;
    } else if (productType == 'Jacket') {
      imageListWillShow = ProductTypeImage.jacketImages;
    } else if (productType == 'Hat') {
      imageListWillShow = ProductTypeImage.hatImages;
    } else if (productType == 'Sport') {
      imageListWillShow = ProductTypeImage.sportImages;
    } else if (productType == 'Cosmetic') {
      imageListWillShow = ProductTypeImage.cosmeticImages;
    } else if (productType == 'Children') {
      imageListWillShow = ProductTypeImage.childrenImages;
    } else {
      imageListWillShow = ProductTypeImage.shirtImages;
    }
  }

  @override
  void initState() {
    checkType();
    super.initState();
  }

  @override
  void dispose() {
    _pageIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackWidget(),
        title: Text(widget.productType),
      ),
      body: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.grey.shade400,
        child: SingleChildScrollView(
          child: FutureBuilder<List<ProductItemModel>>(
            future: SearchProductByTypeApi.getProduct(widget.productType),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SearchProductByCategoryShimmer();
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
                    ImageCarosuel(
                      pageIndexNotifier: _pageIndexNotifier,
                      imageList: imageListWillShow,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Find more product relate to ${widget.productType}",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: datas.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width / 2,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final data = datas[index];
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5.0),
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
                                      'total_price': data.price[0]
                                          ['total_price'],
                                      'average_star': data.rating.isEmpty
                                          ? 0.0
                                          : data.rating[0]['average_star'],
                                    },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
