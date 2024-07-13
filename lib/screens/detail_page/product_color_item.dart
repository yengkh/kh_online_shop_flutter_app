import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';

class ProductColorItem extends StatelessWidget {
  const ProductColorItem({
    super.key,
    required this.itemHeight,
    required this.itemWidth,
    required this.itemTitle,
  });

  final double itemHeight;
  final double itemWidth;
  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    // Get current theme mode
    final themeMode = AdaptiveTheme.of(context).mode;
    // Determine active color based on theme mode
    final activeColor = themeMode == AdaptiveThemeMode.dark
        ? Colors.grey.shade700
        : Colors.white;
    return Container(
      height: itemHeight,
      width: itemWidth,
      decoration: BoxDecoration(
        color: activeColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          boxShadowWidget(),
        ],
      ),
      child: Center(
        child: Text(
          itemTitle,
        ),
      ),
    );
  }
}
