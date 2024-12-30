import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_exercise/Model/product_info.dart';
import 'package:flutter_exercise/Model/request.dart';
import 'package:flutter_exercise/ViewModel/ProductList/product_list_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListRepository repository;

  ProductListBloc({required this.repository})
      : super(ProductListLoadingState()) {
    on<ProductListLoadedEvent>((event, emit) async {
      emit(ProductListLoadingState());
      final searchProductRequest = const SearchProductRequest(
              userCurrency: "aed",
              filter: Filters(
                  keyword: "water",
                  limit: 40,
                  currentPage: 1,
                  source: "products",
                  shouldFilterByIsBuyNow: true,
                  defaultVariantOnly: true))
          .toMap();
      final dynamic json = await repository.getProduct(searchProductRequest);
      final List<dynamic> products = json["data"]["products"];

      List<ProductInfo> productList =
          products.map((element) => ProductInfo.fromJson(element)).toList();

      emit(ProductListLoadedState(productInfo: productList));
    });

    on<ProductListLoadingEvent>((event, emit) {
      emit(ProductListErrorState());
    });
  }
}
