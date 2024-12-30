import 'package:flutter/material.dart';
import 'package:flutter_exercise/Utils/Extensions/PaddingExtension.dart';
import 'package:flutter_exercise/Views/CustomViews/product_item.dart';
import 'package:flutter_exercise/Views/CustomViews/product_properties.dart';

import '../../Model/product_info.dart';
import 'CustomText.dart';

class ProductWithSectionTitle extends StatelessWidget {
  const ProductWithSectionTitle(
      {super.key,
      required this.productInfo,
      required this.context,
      this.title});

  final List<ProductInfo> productInfo;
  final BuildContext context;
  final String? title;

  @override
  Widget build(BuildContext context) {
    double parentHeight = MediaQuery.of(context).size.height * 0.4;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        title?.isNotEmpty == true ? _titleSection() : const SizedBox(),
        SizedBox(
            height: parentHeight,
            width: MediaQuery.of(context).size.width,
            // Set height for the horizontal list
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, subIndex) {
                  return Column(
                    children: [
                      ProductItem(
                        modelInfo: productInfo[subIndex],
                        size: Size(
                          MediaQuery.of(context).size.width * 0.23,
                          parentHeight * 0.3,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: ProductProperties(
                                  modelInfo: productInfo[subIndex])
                              .paddingOnly(left: 10))
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 1,
                  );
                },
                itemCount: 10)),
      ],
    );
  }

  Padding _titleSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CustomText(title: title),
          const Spacer(),
          const Icon(Icons.arrow_forward_rounded)
        ],
      ),
    );
  }
}
