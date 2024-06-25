import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/material/icon_button/icon_button.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text("Hello"),
      actions: [
        IconButtonWidget(
          onPreessEvent: () {},
          iconData: Icons.search_rounded,
        ),
        IconButtonWidget(
          onPreessEvent: () {},
          iconData: Icons.notifications_active_rounded,
        ),
        const SizedBox(
          width: 10.0,
        ),
      ],
    );
  }
}
