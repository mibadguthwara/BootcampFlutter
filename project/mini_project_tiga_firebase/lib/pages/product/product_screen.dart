import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/pages/cart/cart_screen.dart';
import '/logic/product/product_bloc.dart';
import '/logic/profile/user_bloc.dart';
import '/models/product.dart';
import '/models/user.dart';
import '../profile/profile_screen.dart';
import '../notification_screen.dart';
import 'product_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170.0),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserByIdLoaded) {
              final User user = state.user;
              return Column(
                children: [
                  AppBar(
                    automaticallyImplyLeading: false,
                    surfaceTintColor: Colors.transparent,
                    title: Text(
                      'SWG',
                      style: textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSurfaceVariant.withOpacity(0.8)),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NotificationScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.notifications_none),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CartScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.shopping_cart_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ProfileScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.person_outline),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Hai, ',
                                style: textTheme.titleLarge!.copyWith(),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: user.username,
                                    style: textTheme.titleLarge!.copyWith(),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Send to ',
                                    style: textTheme.labelLarge!.copyWith(
                                      color: colorScheme.onSurface
                                          .withOpacity(0.5),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              '${user.address['street']}, ${user.address['city']}',
                                          style:
                                              textTheme.labelLarge!.copyWith()),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: "search for products here",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search),
                            isDense: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoaded) {
                      final List<Product> products = state.allProducts;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            buildProductList(
                                context, products, state.selectedSort),
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductList(
    BuildContext context,
    List<Product> products,
    String value,
  ) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (_, index) {
        return Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetail(
                        productId: products[index].id,
                      ),
                    ),
                  );
                },
                leading: SizedBox(
                  width: 50,
                  child: Image.network(
                    products[index].image,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[index].category,
                      style: textTheme.labelMedium!.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.5)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      products[index].title,
                      style: textTheme.titleMedium!.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.7)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ ${products[index].price}',
                      style: textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                        ),
                        Text(
                          products[index].rating['rate'].toString(),
                          style: textTheme.labelLarge!.copyWith(
                              color: colorScheme.onSurface.withOpacity(0.5)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            Icons.brightness_1,
                            size: 4,
                            color: colorScheme.onSurface.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          '${products[index].rating['count'].toString()} sold',
                          style: textTheme.labelLarge!.copyWith(
                              color: colorScheme.onSurface.withOpacity(0.5)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
