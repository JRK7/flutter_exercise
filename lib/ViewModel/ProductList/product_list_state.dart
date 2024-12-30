part of 'product_list_bloc.dart';

@immutable
sealed class ProductListState {}

final class ProductListLoadingState extends ProductListState {}

class ProductListLoadedState extends ProductListState {
  late final List<ProductInfo> productInfo;

  ProductListLoadedState({required this.productInfo});
}

class ProductListErrorState extends ProductListState {}
