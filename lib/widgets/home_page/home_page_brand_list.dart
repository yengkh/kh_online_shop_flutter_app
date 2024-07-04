import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kh_online_shop_app_flutter/apis/product_brand_api.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';
import 'package:kh_online_shop_app_flutter/models/home_page_product_brand_model.dart';
import 'package:kh_online_shop_app_flutter/screens/shimmer_items/home_page_brand_shimmer.dart';
import 'package:kh_online_shop_app_flutter/screens/view_product_by_brand/view_product_by_brand.dart';
import 'package:kh_online_shop_app_flutter/widgets/more_widget/brand_error_404_or_no_data.dart';

class HomePageBrandList extends StatelessWidget {
  const HomePageBrandList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.0,
      child: FutureBuilder<List<ProductBrandModel>?>(
        future: ProductBrandApi.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomePageBrandShimmer();
          } else if (snapshot.hasError) {
            return const BrandError404OrNoData(
              image: 'assets/images/error-404.png',
            );
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const BrandError404OrNoData(
              image: 'assets/images/empty_data_icon_149938.webp',
            );
          } else {
            final datas = snapshot.data!;
            return GlowingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              color: Colors.grey.shade400,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0, bottom: 2.0),
                scrollDirection: Axis.horizontal,
                itemCount: datas.length,
                itemBuilder: (context, index) {
                  final data = datas[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ViewProductByBrand(
                          brandImage: data.imageUrl,
                          brand: data.name,
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: 60.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          boxShadowWidget(),
                        ],
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          data.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
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
