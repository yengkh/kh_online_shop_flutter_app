import 'package:flutter/material.dart';
import 'package:kh_online_shop_app_flutter/screens/base_pages/base_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Kh Online Shop',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const BasePage(),
    );
  }
}
