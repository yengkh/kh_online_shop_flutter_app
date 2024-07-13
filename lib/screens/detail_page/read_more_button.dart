import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';

class ReadMoreButton extends StatelessWidget {
  const ReadMoreButton({
    super.key,
    required this.title,
    required this.iconDta,
  });
  final String title;
  final IconData iconDta;

  @override
  Widget build(BuildContext context) {
    // Get current theme mode
    final themeMode = AdaptiveTheme.of(context).mode;
    // Determine active color based on theme mode
    final activeColor = themeMode == AdaptiveThemeMode.dark
        ? Colors.grey.shade700
        : Colors.white;
    return Center(
      child: Container(
        width: 155.0,
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: activeColor,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            boxShadowWidget(),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
            ),
            Icon(
              iconDta,
              color: themeMode == AdaptiveThemeMode.dark
                  ? Colors.white
                  : Colors.grey.shade700,
            ),
          ],
        ),
      ),
    );
  }
}
