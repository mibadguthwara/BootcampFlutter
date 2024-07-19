import 'package:flutter/material.dart';

import 'api_services.dart';
import 'product_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Product Category"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: fetchProducts('https://fakestoreapi.com/products'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Jika data berhasil diambil, tampilkan ListView produk
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Product product = snapshot.data![index];
                  return ListTile(
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
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2,
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
