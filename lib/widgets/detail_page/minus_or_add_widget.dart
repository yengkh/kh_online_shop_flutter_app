import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/minus_or_add_sign.dart';

class MinusOrAddWidget extends StatefulWidget {
  const MinusOrAddWidget({
    super.key,
    required this.productPrice,
  });
  final double productPrice;

  @override
  State<MinusOrAddWidget> createState() => _MinusOrAddWidgetState();
}

class _MinusOrAddWidgetState extends State<MinusOrAddWidget> {
  int itemValue = 1;

  double get itemPrice => widget.productPrice * itemValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinusOrAddSign(
          onTapEvent: () {
            setState(() {
              if (itemValue > 1) {
                itemValue--;
              }
            });
          },
          item: "-",
        ),
        const SizedBox(
          width: 8.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "  $itemValue  ",
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            Text(
              '${itemPrice.toStringAsFixed(2)}\$',
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(
          width: 8.0,
        ),
        MinusOrAddSign(
          onTapEvent: () {
            setState(() {
              itemValue++;
            });
          },
          item: "+",
        ),
      ],
    );
  }
}
