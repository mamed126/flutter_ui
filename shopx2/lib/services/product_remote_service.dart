import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:shopx2/models/product_model.dart';

class ProductService {
  static var client = http.Client();

  static Future<List<Product>> getProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      var responseBody = response.body;
      return productFromJson(responseBody);
    } else {
      return List.generate(0, (index) => Product());
    }
  }
}
