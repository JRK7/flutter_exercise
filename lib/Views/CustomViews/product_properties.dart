import 'package:flutter/material.dart';

import '../../../Model/product_info.dart';
import 'CustomText.dart';
import 'custom_bubble.dart';

class ProductProperties extends StatelessWidget {
  const ProductProperties({super.key, required this.modelInfo});

  final ProductInfo modelInfo;

  @override
  Widget build(BuildContext context) {
    return _productDescription(context);
  }

  Widget _productDescription(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getProductDescription(modelInfo),
      ),
    );
  }

  List<Widget> _getProductDescription(ProductInfo info) {
    List<String?> infos = [
      info.name,
    ];
    List<Widget> widgets = infos
        .map((e) => CustomText(
              title: e,
              fontSize: 10,
              overflow: TextOverflow.visible,
            ) as Widget)
        .toList();
    widgets.insert(
      0,
      CustomBubbleWidget(
        title: "Bestseller",
        textColor: Colors.brown,
        iconData: Icons.star,
        imageColor: Colors.white,
        circleBackgroundColor: Colors.brown.withOpacity(0.5),
        circleBorderColor: Colors.brown,
      ),
    );
    widgets.add(Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Colors.orange,
        ),
        CustomText(
          title: "${info.productsupplierInfo?.ratingAverage ?? ""}",
        ),
        CustomText(
          title: "(${info.productsupplierInfo?.ratingCount ?? ""})",
          textColor: Colors.grey.shade600,
          fontWeight: FontWeight.w400,
        )
      ],
    ));
    widgets.addAll([
      (const CustomText(title: "More option")),
      (const CustomText(title: "AED 15")),
      (const CustomText(title: "Delivery today")),
      (const CustomText(title: "Free shipping")),
      (CustomText(
        title: "Alibaba Group | 1688",
        textColor: Colors.orange.shade900,
        overflow: TextOverflow.visible,
      )),
    ]);

    return widgets;
  }
}
