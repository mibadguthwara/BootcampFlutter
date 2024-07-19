import 'dart:convert';
import 'package:http/http.dart' as http;

import 'product_model.dart';

Future<List<Product>> fetchProducts(String apiUrl) async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Product> products =
        body.map((dynamic item) => Product.fromJson(item)).toList();
    return products;
  } else {
    // Jika request gagal, throw error
    throw Exception('Failed to load products');
  }
}
