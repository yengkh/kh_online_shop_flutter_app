import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kh_online_shop_app_flutter/apis/product_category_api.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';
import 'package:kh_online_shop_app_flutter/models/home_page_product_brand_model.dart';
import 'package:kh_online_shop_app_flutter/screens/shimmer_items/home_page_category_shimmer.dart';
import 'package:kh_online_shop_app_flutter/screens/view_product_by_type/view_product_by_type.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/product_error_404_or_no_data.dart';

class ProducctCategoriesWidget extends StatelessWidget {
  const ProducctCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: FutureBuilder<List<ProductBrandModel>>(
        future: ProductCategoryAPI.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomePageCategoryShimmer();
          } else if (snapshot.hasError) {
            return const ProductCategoryErrorOrNoData(
              image: 'assets/images/error-404.png',
              title: "Error!",
            );
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const ProductCategoryErrorOrNoData(
              image: 'assets/images/empty_data_icon_149938.webp',
              title: "No Data!",
            );
          } else {
            final datas = snapshot.data!;
            return GlowingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              color: Colors.grey.shade400,
              child: GridView.builder(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                ),
                itemCount: datas.length,
                itemBuilder: (BuildContext context, index) {
                  final data = datas[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ViewProductByType(
                          productType: data.name,
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 55.0,
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            bottom: 5.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            boxShadow: [
                              boxShadowWidget(),
                            ],
                          ),
                          child: Image.network(
                            data.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(data.name),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
