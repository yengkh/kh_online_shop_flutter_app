import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get current theme mode
    final themeMode = AdaptiveTheme.of(context).mode;
    // Determine active color based on theme mode
    final activeColor =
        themeMode == AdaptiveThemeMode.dark ? Colors.white70 : Colors.black;
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: activeColor,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }
}
