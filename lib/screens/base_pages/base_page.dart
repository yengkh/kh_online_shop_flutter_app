import 'package:adaptive_theme/adaptive_theme.dart';
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
    // Get current theme mode
    final themeMode = AdaptiveTheme.of(context).mode;
    // Determine active color based on theme mode
    final activeColor = themeMode == AdaptiveThemeMode.dark
        ? Colors.grey.shade700
        : Colors.white;
    return Scaffold(
      body: BodyPage.body[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: activeColor,
        inactiveColor: themeMode == AdaptiveThemeMode.dark
            ? Colors.white70
            : Colors.grey.shade600,
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
