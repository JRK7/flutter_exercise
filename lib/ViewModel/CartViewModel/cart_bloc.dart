import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Model/cart_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoaded()) {
    on<CartEvent>((event, emit) {
      final cartLoadedState = state as CartLoaded;
      if (cartLoadedState.cartItems != null) {
        List<CartItem>? carts = cartLoadedState.cartItems;

        if (event.cartItem != null &&
            carts?.contains(event.cartItem) == false) {
          cartLoadedState.cartItems?.add(event.cartItem!);
        }
        emit(CartLoaded(cartItems: cartLoadedState.cartItems));
      } else {
        List<CartItem> cartItems = event.cartItem == null
            ? List.generate(2, (index) => CartItem(shouldExpand: true)).toList()
            : [event.cartItem!].toList();
        emit(CartLoaded(cartItems: cartItems));
      }
      // TODO: implement event handler
    });

    on<CartEventExpand>((event, emit) {
      final cartLoadedState = state as CartLoaded;
      List<CartItem>? updatedCartItems =
          cartLoadedState.cartItems?.map((cartItem) {
        if (cartItem == event.cartItem) {
          return CartItem(
              shouldExpand: !cartItem.shouldExpand,
              products: event.cartItem?.products);
        }
        return cartItem; // Otherwise, leave the cartItem unchanged
      }).toList();
      emit(CartLoaded(cartItems: updatedCartItems));
    });
  }
}
