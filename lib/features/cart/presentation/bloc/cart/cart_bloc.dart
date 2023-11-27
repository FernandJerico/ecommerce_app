import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const _Loaded([])) {
    on<_Add>((event, emit) {
      final currentState = state as _Loaded;
      // jiika produk ada di cart, maka tambahkan qty
      final index = currentState.carts
          .indexWhere((element) => element.product.id == event.cart.product.id);
      if (index >= 0) {
        currentState.carts[index].qty += 1;
        emit(const _Loading());
        emit(_Loaded(currentState.carts));
      } else {
        emit(_Loaded([...currentState.carts, event.cart]));
      }
    });

    on<_Remove>((event, emit) {
      final currentState = state as _Loaded;
      // jiika produk ada di cart, maka tambahkan qty
      final index = currentState.carts
          .indexWhere((element) => element.product.id == event.cart.product.id);
      if (index >= 0) {
        currentState.carts[index].qty -= 1;
        if (currentState.carts[index].qty <= 0) {
          currentState.carts.removeAt(index);
        }
        emit(const _Loading());
        emit(_Loaded(currentState.carts));
      }
    });

    on<_Delete>((event, emit) {
      final currentState = state as _Loaded;

      // Temukan indeks produk yang akan dihapus
      final index = currentState.carts
          .indexWhere((element) => element.product.id == event.cart.product.id);

      if (index >= 0) {
        // Buat salinan list yang dapat diubah
        final List<Cart> updatedCarts = List.from(currentState.carts);

        // Hapus produk dari keranjang pada salinan list
        updatedCarts.removeAt(index);

        emit(const _Loading());
        emit(_Loaded(updatedCarts));
      }
    });

    on<_Started>((event, emit) {
      emit(const _Loading());
      emit(const _Loaded([]));
    });
  }
}
