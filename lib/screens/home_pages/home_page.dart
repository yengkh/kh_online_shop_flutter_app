import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_carocel_slider.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_app_bar.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_brand_list.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_items.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_top_products.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/icon_with_text_widget.dart';

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
        color: Colors.pink.shade300,
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              HomePageCarocelSlider(),
              IconWithTextWidget(
                iconData: Icons.star_rounded,
                title: "Popular Brands",
              ),
              HomePageBrandList(),
              IconWithTextWidget(
                iconData: Icons.list_alt_rounded,
                title: "Product Categories",
              ),
              IconWithTextWidget(
                iconData: Icons.star_rounded,
                title: "Top Products Of The Month",
              ),
              HomePageTopProducts(),
              IconWithTextWidget(
                iconData: Icons.search_rounded,
                title: "Explore",
              ),
              HomePageItems(),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
