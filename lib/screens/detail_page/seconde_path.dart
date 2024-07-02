import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/detail_page/share_bottom_sheet.dart';

class SecondePath extends StatelessWidget {
  const SecondePath({
    super.key,
    required this.productRating,
  });
  final Map<String, dynamic> productRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                color: productRating['average_star'] != 0
                    ? Colors.pink
                    : Colors.grey.shade700,
                size: 25.0,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                productRating['average_star'] == 0
                    ? "0.0 (0)"
                    : "${productRating['average_star']} (${productRating['user_rate']})",
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
                context: context,
                builder: (BuildContext context) {
                  return const ShareBottomShett();
                },
              );
            },
            icon: Icon(
              Icons.share,
              size: 25.0,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
