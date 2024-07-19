import 'package:flutter/material.dart';

import 'api_services.dart';
import 'product_model.dart';

class ProductJeweleryScreen extends StatelessWidget {
  const ProductJeweleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jewelery Product"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: fetchProducts(
              'https://fakestoreapi.com/products/category/jewelery'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Jika data berhasil diambil, tampilkan ListView produk
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Product product = snapshot.data![index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.green.shade300,
                        ),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: ListTile(
                      title: Text(
                        product.title,
                        maxLines: 2,
                      ),
                      subtitle: Text(product.category),
                      leading: Image.network(
                        product.image,
                        width: 80,
                      ),
                      trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              // Jika terjadi error saat mengambil data
              return Text("${snapshot.error}");
            }

            // By default, tampilkan indikator loading
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
