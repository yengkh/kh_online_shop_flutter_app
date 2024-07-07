import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/cart_pages/cart_page.dart';
import 'package:kh_online_shop_app_flutter/screens/favorite_pages/favorite_page.dart';
import 'package:kh_online_shop_app_flutter/screens/home_pages/home_page.dart';
import 'package:kh_online_shop_app_flutter/screens/setting_pages/setting_page.dart';

class BodyPage {
  static List<Widget> body = [
    const HomePage(),
    CartPage(),
    const FavoritePage(),
    const SettingPage(),
  ];
}
