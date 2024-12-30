import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/Utils/Extensions/PaddingExtension.dart';
import 'package:flutter_exercise/ViewModel/ProductList/product_list_bloc.dart';
import 'package:flutter_exercise/Views/CustomViews/product_list_item.dart';

import '../CustomViews/app_bar.dart';
import '../CustomViews/custom_search_bar.dart';

class SearchProductListPage extends StatelessWidget {
  const SearchProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchProduct(context: context, isFreshLoading: true);
    });

    return BlocConsumer<ProductListBloc, ProductListState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ProductListLoadedState) {
          FocusScope.of(context).unfocus();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: customAppBar(context),
          body: Column(
            children: [
              CustomSearchBar(
                onEditingComplete: (text) {
                  _fetchProduct(context: context, text: text);
                },
              ),
              Row(
                children: [
                  Container(
                      decoration: BoxDecorationCustom.boxDecoration(
                          decorationColorOpacity: 0.5),
                      child: const SizedBox(
                          height: 30,
                          width: 30,
                          child: Icon(Icons.arrow_drop_down))),
                ],
              ).paddingOnly(top: 10, left: 10),
              const SizedBox(
                height: 20,
              ),
              _loadList(state, context)
            ],
          ),
        );
      },
    );
  }

  Expanded _loadList(ProductListState state, BuildContext context) {
    return Expanded(
      child: state is ProductListLoadedState
          ? _listViewProducts(state, context)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _listViewProducts(ProductListLoadedState state, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _fetchProduct(context: context, isFreshLoading: true);
      },
      child: ListView.separated(
        itemBuilder: (context, item) {
          return ProductListItem(modelInfo: state.productInfo[item]);
        },
        itemCount: state.productInfo.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }

  Future<void> _fetchProduct(
      {required BuildContext context,
      String? text,
      bool isFreshLoading = false}) async {
    if (isFreshLoading) {
      BlocProvider.of<ProductListBloc>(context)
          .add(ProductListLoadedEvent(searchText: text ?? ""));
    } else if (text?.isNotEmpty == true) {
      BlocProvider.of<ProductListBloc>(context)
          .add(ProductListLoadedEvent(searchText: text ?? ""));
    }
  }
}
