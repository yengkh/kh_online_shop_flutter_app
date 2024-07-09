import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/material/state_magement/add_product_to_favorite_controller.dart';
import 'package:kh_online_shop_app_flutter/material/state_magement/add_to_cart_controller.dart';
import 'package:kh_online_shop_app_flutter/screens/base_pages/base_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProductToCart());
    Get.put(AddProductToFavoriteController());
    return GetMaterialApp(
      scrollBehavior: const ScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Kh Online Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.white),
        useMaterial3: true,
      ),
      home: const BasePage(),
    );
  }
}
