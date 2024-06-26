import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/apis/product_brand_api.dart';
import 'package:kh_online_shop_app_flutter/models/home_page_product_brand_model.dart';

class HomePageBrandList extends StatelessWidget {
  const HomePageBrandList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.0,
      child: FutureBuilder<List<ProductBrandModel>?>(
        future: ProductBrandApi.fetchData(),
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
              color: Colors.pink.shade300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: datas.length,
                itemBuilder: (context, index) {
                  final data = datas[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80.0,
                          width: 100.0,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
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
                        Container(
                          height: 20.0,
                          width: 100.0,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              data.name,
                            ),
                          ),
                        ),
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
