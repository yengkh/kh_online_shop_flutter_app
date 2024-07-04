import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kh_online_shop_app_flutter/models/product_item_model.dart';

class SearchProductByTypeApi {
  static Future<List<ProductItemModel>> getProduct(String type) async {
    final respone = await http.get(
      Uri.parse("http://192.168.43.83:8000/products/search-by-type/$type"),
    );

    if (respone.statusCode == 200) {
      List jsonRespone = json.decode(respone.body);
      return jsonRespone
          .map((data) => ProductItemModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
