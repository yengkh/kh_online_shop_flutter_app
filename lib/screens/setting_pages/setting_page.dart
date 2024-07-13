import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/setting_pages/card_item.dart';
import 'package:kh_online_shop_app_flutter/screens/setting_pages/language_bottom_sheet.dart';
import 'package:kh_online_shop_app_flutter/screens/setting_pages/log_out_button.dart';
import 'package:kh_online_shop_app_flutter/screens/setting_pages/profile_path.dart';
import 'package:kh_online_shop_app_flutter/screens/setting_pages/theme_mode_select.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Map<String, dynamic> myPackageData = {};

  @override
  void initState() {
    super.initState();
    fetchPackageInfo();
  }

  Future<void> fetchPackageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      myPackageData = {
        'appName': packageInfo.appName,
        'packageName': packageInfo.packageName,
        'version': packageInfo.version,
        'buildNumber': packageInfo.buildNumber,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('myProfile'),
        ),
      ),
      body: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.grey.shade400,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const ProfilePath(),
              const SizedBox(
                height: 15.0,
              ),
              CardItem(
                onTapEvent: () {},
                title: context.tr('address'),
                description: "Phnom Penh",
                iconsData: Icons.maps_home_work_rounded,
              ),
              const SizedBox(
                height: 15.0,
              ),
              CardItem(
                onTapEvent: () {},
                title: 'paymentHistory'.tr(),
                description: context.tr('paymentSubTitle'),
                iconsData: Icons.payment,
              ),
              const SizedBox(
                height: 15.0,
              ),
              CardItem(
                title: context.tr('languages'),
                description: context.tr('languagesSubTitle'),
                iconsData: Icons.language_rounded,
                trailingEvent: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const ProfileBottomSheet();
                    },
                  );
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              CardItem(
                title: context.tr('themeMode'),
                description: context.tr('themeModeSubTitle'),
                iconsData: Icons.sunny,
                trailingEvent: () => showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const ThemeModeSelect();
                  },
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              CardItem(
                title: context.tr('aboutUs'),
                description: context.tr('aboutUsSubTilte'),
                iconsData: Icons.info_rounded,
                trailingEvent: () {},
              ),
              const SizedBox(
                height: 70.0,
              ),
              const LogOutButton(),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                    "${context.tr('appVersion')} : ${myPackageData['version'].toString()}"),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
