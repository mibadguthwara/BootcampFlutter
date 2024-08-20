import 'dart:convert';
import 'package:http/http.dart';

import '../models/cart.dart';
import '../models/product.dart';
import 'product_repository.dart';

class CartRepository {
  final ProductRepository productRepository;

  CartRepository({required this.productRepository});
  Future<List<Cart>> getCarts() async {
    const String url = 'https://fakestoreapi.com/carts';

    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      var hasil = result.map((e) => Cart.fromJson(e)).toList();
      return hasil;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Product> getProductById(int productId) async {
    return await productRepository.getById(productId);
  }
}
