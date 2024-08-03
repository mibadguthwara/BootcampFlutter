import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/product.dart';
import '/services/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository = ProductRepository();

  ProductBloc() : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final List<Product> products = await _productRepository.getProducts();
        final List<String> categories =
            products.map((e) => e.category).toSet().toList();
        final List<Product> filteredProducts = products
            .where((product) => product.category == categories.first)
            .toList();

        emit(ProductLoaded(
          allProducts: products,
          filteredProducts: filteredProducts,
          selectedCategory: categories.first,
          selectedSort: 'name',
        ));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<LoadProductsBySort>((event, emit) async {
      final currentState = state;
      if (currentState is ProductLoaded) {
        final List<Product> products = currentState.allProducts;

        products.sort((a, b) {
          switch (event.sort) {
            case 'name':
              return a.title.compareTo(b.title);
            case 'price':
              return b.price.compareTo(a.price);
            case 'rating':
              return b.rating['rate'].compareTo(a.rating['rate']);
            case 'sold':
              return b.rating['count'].compareTo(a.rating['count']);
            default:
              return 0;
          }
        });

        emit(currentState.copyWith(
          allProducts: products,
          selectedSort: event.sort,
        ));
      }
    });

    on<LoadProductByCategory>((event, emit) async {
      final currentState = state;
      if (currentState is ProductLoaded) {
        final filteredProducts = currentState.allProducts.where((product) {
          return product.category == event.category;
        }).toList();

        emit(currentState.copyWith(
          selectedCategory: event.category,
          filteredProducts: filteredProducts,
        ));
      }
    });

    on<LoadProductDetail>((event, emit) async {
      try {
        final product = await _productRepository.getById(event.id);
        emit(ProductDetailLoaded(product));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
