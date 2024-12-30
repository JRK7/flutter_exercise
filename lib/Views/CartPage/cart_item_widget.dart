import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/Views/CustomViews/product_list_item.dart';

import '../../Model/cart_item.dart';
import '../../ViewModel/CartViewModel/cart_bloc.dart';
import '../CustomViews/CustomText.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  final CartItem? cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              // Disable highlight effect
              splashColor: Colors.transparent,
              onTap: () {
                BlocProvider.of<CartBloc>(context)
                    .add(CartEventExpand(cartItem: cartItem));
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "Shipment1",
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        title: "1 item",
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      )
                    ],
                  ),
                  Icon(cartItem?.shouldExpand == true
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up),
                ],
              ),
            ),
            // Check if item should expand
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: cartItem?.shouldExpand == true
                  ? Column(
                      children: [
                        const Divider(),
                        ProductListItem(
                          modelInfo: cartItem!.products![0],
                          showProductAdd: false,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
