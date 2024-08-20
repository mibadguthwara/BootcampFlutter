import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cart/cart_bloc.dart';
import '../../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is LoadingCartState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedCartState) {
            return ListView.builder(
              itemCount: state.carts.length,
              itemBuilder: (context, index) {
                final cart = state.carts[index];
                return ExpansionTile(
                  title: Text('Cart ${cart.id} | User Id: ${cart.userId}'),
                  subtitle: Text('Date: ${cart.date.toLocal()}'),
                  children: cart.products.map(
                    (cartProduct) {
                      return FutureBuilder<Product>(
                        future: context
                            .read<CartBloc>()
                            .getProductById(cartProduct.productId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const ListTile(
                              title: Text('Loading...'),
                            );
                          } else if (snapshot.hasError) {
                            return ListTile(
                              title: Text('Error: ${snapshot.error}'),
                            );
                          } else if (snapshot.hasData) {
                            final product = snapshot.data!;
                            return Card(
                              child: ListTile(
                                leading:
                                    Image.network(product.image, width: 100),
                                title: Text(
                                    '${product.title}\n\$${product.price}'),
                                subtitle: Text(
                                  'Quantity: ${cartProduct.quantity} | Total: \$${product.price * cartProduct.quantity.toInt()}',
                                ),
                                onTap: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Cart Detail"),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.close),
                                            ),
                                          ],
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Image.network(product.image,
                                                height: 200),
                                            const SizedBox(height: 10),
                                            Text(
                                              product.title,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('\$${product.price}'),
                                            const SizedBox(height: 15),
                                            Text(
                                              'Description: ${product.description}',
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              'Quantity: ${cartProduct.quantity} | Total: \$${product.price * cartProduct.quantity.toInt()}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          } else {
                            return const ListTile(
                              title: Text('No Data'),
                            );
                          }
                        },
                      );
                    },
                  ).toList(),
                );
              },
            );
          } else if (state is CartErrorState) {
            return Center(child: Text('Failed to load cart: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
