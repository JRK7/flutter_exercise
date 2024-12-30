import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/Model/product_info.dart';
import 'package:flutter_exercise/Utils/Extensions/PaddingExtension.dart';
import 'package:flutter_exercise/ViewModel/CartViewModel/cart_bloc.dart';

import '../../Model/cart_item.dart';
import 'network_image_with_loader.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.modelInfo,
      required this.size,
      this.showProductAdd = true});

  final ProductInfo modelInfo;
  final Size size;
  final bool showProductAdd;

  @override
  Widget build(BuildContext context) {
    return _imageContainer(context);
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color with opacity
            blurRadius: 8.0, // Blur the shadow to make it softer
            spreadRadius: 0.0, // Do not spread the shadow
            offset: const Offset(0,
                2), // Position the shadow below the container (bottom shadow)
          ),
        ],
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white);
  }

  Widget _imageContainer(BuildContext context) {
    return Container(
        decoration: _decoration(),
        height: size.height,
        width: size.width,
        child: [
          NetworkImageWithLoader(
            imageUrl: modelInfo.imageUrl ?? "",
          ),
          if (showProductAdd)
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _productActionContainer(
                      Icons.favorite_border_outlined, context),
                  _productActionContainer(Icons.add, context),
                ],
              ),
            )
        ].stackWidgets());
  }

  Widget _productActionContainer(IconData iconData, BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          height: 25,
          width: 25,
          decoration: _decoration(),
          child: Icon(
            iconData,
            size: 20,
          ),
        ),
        onTap: () {
          CartItem cartItem =
              CartItem(shouldExpand: true, products: [modelInfo]);
          BlocProvider.of<CartBloc>(context).add(CartEvent(cartItem: cartItem));
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        builder: (parentContext) {
          return ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6,
                minHeight: 20,
                minWidth: MediaQuery.of(context).size.width),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                widget,
              ],
            ).paddingOnly(top: 10, bottom: 0),
          );
        });
  }
}
