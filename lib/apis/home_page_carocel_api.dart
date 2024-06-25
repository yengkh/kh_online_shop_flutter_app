import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kh_online_shop_app_flutter/models/home_page_carocel_model.dart';

class HomePageCarocelAPI {
  static Future<List<CarocelModel>> fetchImages() async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.43.83:8000/promotion-banner/get-promotion-banner/'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => CarocelModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
