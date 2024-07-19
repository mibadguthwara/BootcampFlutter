import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  group('fetchProducts', () {
    /// All Product
    test('Fetch products from fakestoreapi', () async {
      // Setup
      var url = Uri.parse('https://fakestoreapi.com/products');

      // Action
      var response = await http.get(url);
      expect(response.statusCode, 200);

      // Convert response body to List<Map<String, dynamic>>
      List<dynamic> products = jsonDecode(response.body);

      // Assertion
      expect(products, isA<List>());
      if (products.isNotEmpty) {
        expect(products[0], isA<Map<String, dynamic>>());
        expect(products[0].containsKey('id'), true);
        expect(products[0].containsKey('title'), true);
        expect(products[0].containsKey('price'), true);
      }
    });

    /// Jewelery Product
    test('Fetch jewelry products from fakestoreapi', () async {
      // Setup
      var url =
          Uri.parse('https://fakestoreapi.com/products/category/jewelery');

      // Action
      var response = await http.get(url);
      expect(response.statusCode, 200);

      // Convert response body to List<Map<String, dynamic>>
      List<dynamic> products = jsonDecode(response.body);

      // Assertion
      expect(products, isA<List>());
      if (products.isNotEmpty) {
        expect(products[0], isA<Map<String, dynamic>>());
        expect(products[0].containsKey('id'), true);
        expect(products[0].containsKey('title'), true);
        expect(products[0].containsKey('price'), true);
      }
    });
  });
}
