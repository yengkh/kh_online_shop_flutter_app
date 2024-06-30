import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kh_online_shop_app_flutter/apis/product_item_api.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';
import 'package:kh_online_shop_app_flutter/models/product_item_model.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/detail_page_from_product_item.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_child_item.dart';

class HomePageItems extends StatelessWidget {
  const HomePageItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductItemModel>>(
      future: ProductItemAPI.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
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
                      () => const DetailPageFromProductItem(),
                    );
                  },
                  child: ProductChildItem(
                    imageUrlString: data.images[0]['other_color_one'],
                    productName: data.name,
                    productPrice:
                        '${data.price[0]['total_price'].toString()} \$',
                    productBrand: data.productBrand,
                    ratingStar: data.rating[0]['average_star'],
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
