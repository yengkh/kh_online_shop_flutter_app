import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/material/icon_button/icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
    );
  }
}
