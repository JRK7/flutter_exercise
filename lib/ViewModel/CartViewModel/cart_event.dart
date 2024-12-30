part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  const CartEvent({this.cartItem});

  final CartItem? cartItem;

  @override
  // TODO: implement props
  List<Object?> get props => [cartItem];
}

class CartEventExpand extends CartEvent {
  const CartEventExpand({this.cartItem});

  final CartItem? cartItem;

  @override
  // TODO: implement props
  List<Object?> get props => [cartItem];
}
