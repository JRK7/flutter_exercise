part of 'product_list_bloc.dart';

@immutable
sealed class ProductListEvent {}

class ProductListLoadingEvent extends ProductListEvent {}

class ProductListLoadedEvent extends ProductListEvent {
  final String? searchText;

  ProductListLoadedEvent({this.searchText});
}

class ProductListErrorEvent extends ProductListEvent {}
