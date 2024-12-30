import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/ViewModel/CartViewModel/cart_bloc.dart';
import 'package:flutter_exercise/Views/CustomViews/CustomText.dart';
import 'package:flutter_exercise/Views/CustomViews/custom_search_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/asset_manager.dart';
import '../CustomViews/app_bar.dart';
import 'cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              padding: const EdgeInsets.only(bottom: 10),
              color: Colors.white,
              child: CustomSearchBar()),
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded && state.cartItems != null) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              final cartItem = state.cartItems?[index];
                              if (cartItem == state.cartItems?.last) {
                                return Column(
                                  children: [
                                    CartItemWidget(cartItem: cartItem),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    title: "Savings",
                                                    textColor:
                                                        Color(0xFF4CAF50),
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  CustomText(
                                                    title: "Total",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  CustomText(
                                                    title:
                                                        "Total price excl. shipping",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 10,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  CustomText(
                                                    title:
                                                        "AED ${state.totalCost}",
                                                    textColor:
                                                        const Color(0xFF4CAF50),
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const CustomText(
                                                        title: "AED",
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      CustomText(
                                                        title:
                                                            "${state.totalCost}",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return CartItemWidget(cartItem: cartItem);
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                color: Colors.grey.shade200,
                              );
                            },
                            itemCount: state.cartItems?.length ?? 0),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          color: const Color(0xFFF06220),
                          child: InkWell(
                            onTap: () {},
                            child: const Center(
                              child: CustomText(
                                title: "CHECKOUT",
                                textColor: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImageAsset.cart,
                    ),
                    const CustomText(
                      title: "Your cart is empty",
                      fontWeight: FontWeight.bold,
                    ),
                    const CustomText(
                      title: "Brows our products and start shopping",
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
