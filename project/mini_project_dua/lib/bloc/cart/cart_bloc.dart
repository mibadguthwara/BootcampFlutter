import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/cart_repository.dart';
import '/models/cart.dart';
import '/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  CartBloc(this._cartRepository) : super(LoadingCartState()) {
    on<LoadCartEvent>((event, emit) async {
      try {
        final carts = await _cartRepository.getCarts();
        emit(LoadedCartState(carts));
      } catch (e) {
        emit(CartErrorState(e.toString()));
      }
    });
  }
  Future<Product> getProductById(int productId) async {
    return await _cartRepository.getProductById(productId);
  }
}
