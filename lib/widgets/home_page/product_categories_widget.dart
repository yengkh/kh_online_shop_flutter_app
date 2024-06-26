import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';

class ProducctCategoriesWidget extends StatelessWidget {
  const ProducctCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.right,
        color: Colors.grey.shade400,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            childAspectRatio: 3 / 2.5,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      boxShadowWidget(),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      boxShadowWidget(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
