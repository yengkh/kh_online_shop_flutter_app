import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/material/box_shadow/box_shadow_util.dart';

class HomePageTopProducts extends StatelessWidget {
  const HomePageTopProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get current theme mode
    final themeMode = AdaptiveTheme.of(context).mode;
    // Determine active color based on theme mode
    final activeColor = themeMode == AdaptiveThemeMode.dark
        ? Colors.grey.shade700
        : Colors.white;
    return SizedBox(
      height: 270.0,
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.right,
        color: Colors.grey.shade400,
        child: ListView.builder(
          padding: const EdgeInsets.all(5.0),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 10.0,
              ),
              child: Container(
                height: 230.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: activeColor,
                  boxShadow: [
                    boxShadowWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
