import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/material/state_magement/add_product_to_favorite_controller.dart';
import 'package:kh_online_shop_app_flutter/material/state_magement/add_to_cart_controller.dart';
import 'package:kh_online_shop_app_flutter/screens/base_pages/base_page.dart';
import 'package:kh_online_shop_app_flutter/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('km')],
        fallbackLocale: const Locale('en'),
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProductToCart());
    Get.put(AddProductToFavoriteController());
    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => GetMaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        scrollBehavior: const ScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Kh Online Shop',
        theme: theme,
        darkTheme: darkTheme,
        home: const BasePage(),
      ),
    );
  }
}
