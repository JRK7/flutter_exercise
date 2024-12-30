part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
}

final class CartLoaded extends CartState {
  final List<CartItem>? cartItems;
  double get totalCost {
    return (cartItems?.length ?? 0) * 15;
  }

  const CartLoaded({this.cartItems});

  @override
  List<Object?> get props => [cartItems];
}
