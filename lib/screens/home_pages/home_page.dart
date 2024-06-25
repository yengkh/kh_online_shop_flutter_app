import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_carocel_slider.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_app_bar.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_brand_list.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_items.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/home_page_top_products.dart';

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
            children: [
              SizedBox(
                height: 15.0,
              ),
              HomePageCarocelSlider(),
              SizedBox(
                height: 15.0,
              ),
              HomePageBrandList(),
              SizedBox(
                height: 15.0,
              ),
              HomePageBrandList(),
              SizedBox(
                height: 15.0,
              ),
              HomePageTopProducts(),
              SizedBox(
                height: 15.0,
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
