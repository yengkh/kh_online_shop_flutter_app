import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/minus_or_add_sign.dart';

class MinusOrAddWidget extends StatelessWidget {
  const MinusOrAddWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MinusOrAddSign(
          item: "-",
        ),
        Text(
          "  0  ",
          style: TextStyle(fontSize: 20.0),
        ),
        MinusOrAddSign(
          item: "+",
        ),
      ],
    );
  }
}
