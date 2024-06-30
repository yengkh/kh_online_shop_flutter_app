import 'package:kh_online_shop_app_flutter/models/product_item_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductItemAPI {
  static Future<List<ProductItemModel>> getData() async {
    final response = await http.get(
      Uri.parse('http://192.168.43.83:8000/products/export-function/'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => ProductItemModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
