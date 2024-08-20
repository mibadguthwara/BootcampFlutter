import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/product/product_bloc.dart';

class ProductDetail extends StatelessWidget {
  final int productId;
  const ProductDetail({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: BlocProvider(
        create: (context) => ProductBloc()..add(LoadProductDetail(productId)),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailLoaded) {
              final product = state.product;
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.network(
                                product.image,
                                height: 200,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text('Category: ${product.category}'),
                            const SizedBox(height: 5.0),
                            Text(product.title,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$${product.price}',
                                    style: const TextStyle(fontSize: 20)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.star_rate_rounded,
                                        color: Colors.amber),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      product.rating["rate"].toString(),
                                      style: const TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '(${product.rating["count"]} sold)',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 122, 111, 111),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Text(product.description),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                    Positioned(
                      bottom: 10,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Add to Cart"),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is ProductErrorState) {
              return Center(
                  child:
                      Text('Failed to load product detail: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
