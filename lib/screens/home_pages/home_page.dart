import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_carocel_slider.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_app_bar.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_brand_list.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_items.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_top_products.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/icon_with_text_widget.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/product_categories_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 55.0),
        child: const HomePageAppBar(),
      ),
      body: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.grey.shade400,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const HomePageCarocelSlider(),
              const SizedBox(
                height: 20.0,
              ),
              IconWithTextWidget(
                iconData: Icons.star_rounded,
                title: context.tr('popularBrand'),
              ),
              const HomePageBrandList(),
              const SizedBox(
                height: 20.0,
              ),
              IconWithTextWidget(
                iconData: Icons.list_alt_rounded,
                title: context.tr('popularCategory'),
              ),
              const ProducctCategoriesWidget(),
              IconWithTextWidget(
                iconData: Icons.star_rounded,
                title: context.tr('topProductOfTheMounth'),
              ),
              const HomePageTopProducts(),
              const SizedBox(
                height: 10.0,
              ),
              IconWithTextWidget(
                iconData: Icons.search_rounded,
                title: context.tr('exploreMore'),
              ),
              const HomePageItems(),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
