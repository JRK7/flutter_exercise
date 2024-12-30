import 'package:flutter/material.dart';
import 'package:flutter_exercise/Model/product_info.dart';
import 'package:flutter_exercise/Views/CustomViews/product_item.dart';
import 'package:flutter_exercise/Views/CustomViews/product_properties.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem(
      {super.key, required this.modelInfo, this.showProductAdd = true});

  final ProductInfo modelInfo;
  final bool showProductAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProductItem(
            modelInfo: modelInfo,
            size: Size(
              MediaQuery.of(context).size.height * 0.15,
              MediaQuery.of(context).size.width * 0.28,
            ),
            showProductAdd: showProductAdd,
          ), // Assuming this has a fixed height or aspect ratio
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: ProductProperties(
            modelInfo: modelInfo,
          )),
        ])
      ]),
    );
  }
}
