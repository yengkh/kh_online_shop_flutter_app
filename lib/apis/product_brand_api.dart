import 'dart:convert';

import 'package:kh_online_shop_app_flutter/models/home_page_product_brand_model.dart';
import 'package:http/http.dart' as http;

class ProductBrandApi {
  static Future<List<ProductBrandModel>> fetchData() async {
    final respone = await http.get(
      Uri.parse("http://192.168.43.83:8000/top-brands/get-product-brand/"),
    );

    if (respone.statusCode == 200) {
      List jsonRespone = json.decode(respone.body);
      return jsonRespone
          .map((data) => ProductBrandModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
