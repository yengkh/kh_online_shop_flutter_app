import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/material/icon_button/icon_button.dart';
import 'package:kh_online_shop_app_flutter/screens/profile_page/profile.dart';
import 'package:kh_online_shop_app_flutter/widgets/home_page/user_profile_widget.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: UserProfileWidget(
        onTapEvent: () {
          Get.to(
            () => const UserProfile(),
          );
        },
      ),
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
