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
    return Center(
      child: Container(
        width: 155.0,
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
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
              color: Colors.grey.shade700,
            ),
          ],
        ),
      ),
    );
  }
}
