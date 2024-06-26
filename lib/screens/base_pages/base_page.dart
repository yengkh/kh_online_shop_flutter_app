import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/material/bottom_nav_icons_list/bttom_nav_icons_list.dart';
import 'package:kh_online_shop_app_flutter/screens/base_pages/body_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

int _currentIndex = 0;

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyPage.body[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        inactiveColor: Colors.grey.shade700,
        activeColor: Colors.pink,
        elevation: 0.0,
        icons: BttomNavIconsList.iconList,
        activeIndex: _currentIndex,
        gapWidth: 1.0,
        iconSize: 25.0,
        splashColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
