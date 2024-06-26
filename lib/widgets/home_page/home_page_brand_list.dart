import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/apis/product_brand_api.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';
import 'package:kh_online_shop_app_flutter/models/home_page_product_brand_model.dart';

class HomePageBrandList extends StatelessWidget {
  const HomePageBrandList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.0,
      child: FutureBuilder<List<ProductBrandModel>?>(
        future: ProductBrandApi.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
                strokeWidth: 2.0,
              ),
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
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: datas.length,
                itemBuilder: (context, index) {
                  final data = datas[index];
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8.0, right: 20.0),
                        height: 50.0,
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
                      const SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        height: 18.0,
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
                        child: Center(
                          child: Text(
                            data.name,
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                      ),
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
