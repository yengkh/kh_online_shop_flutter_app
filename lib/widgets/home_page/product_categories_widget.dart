import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/apis/product_category_api.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';
import 'package:kh_online_shop_app_flutter/models/home_page_product_brand_model.dart';

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
            return GlowingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              color: Colors.grey.shade400,
              child: GridView.builder(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 10.0,
                ),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                  //childAspectRatio: 3 / 2.5,
                ),
                itemCount: datas.length,
                itemBuilder: (BuildContext context, index) {
                  final data = datas[index];
                  return Column(
                    children: [
                      Container(
                        //margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(8.0),
                        height: 70,
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
                      // Container(
                      //   margin: const EdgeInsets.all(5.0),
                      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(5.0),
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       boxShadowWidget(),
                      //     ],
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       data.name,
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //     ),
                      //   ),
                      // ),
                    ],
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
