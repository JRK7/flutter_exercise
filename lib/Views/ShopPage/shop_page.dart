import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/Model/product_info.dart';
import 'package:flutter_exercise/Utils/Extensions/PaddingExtension.dart';
import 'package:flutter_exercise/ViewModel/Carousel/carousel_bloc.dart';
import 'package:flutter_exercise/Views/CustomViews/custom_bubble.dart';
import 'package:flutter_exercise/Views/CustomViews/custom_tab_list.dart';
import 'package:flutter_exercise/Views/CustomViews/network_image_with_loader.dart';
import 'package:flutter_exercise/Views/CustomViews/product_with_section_title.dart';

import '../../ViewModel/ProductList/product_list_bloc.dart';
import '../CustomViews/animated_widget.dart';
import '../CustomViews/app_bar.dart';
import '../CustomViews/carousel_with_indicator.dart';
import '../CustomViews/custom_search_bar.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchProduct(context: context);
    });

    return Scaffold(
      appBar: customAppBar(context),
      body: BlocProvider(
        create: (context) => CarouselBloc(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTabList(
                widgets: const [
                  CustomBubbleWidget(
                    title: "For you",
                    bubbleBackgroundColor: Colors.transparent,
                  ),
                  CustomBubbleWidget(
                    title: "Explore",
                    bubbleBackgroundColor: Colors.transparent,
                  ),
                  CustomBubbleWidget(
                    size: Size(30, 30),
                    title: "1688",
                    imageColor: Colors.orange,
                    iconData: Icons.local_fire_department_sharp,
                    bubbleBackgroundColor: Colors.transparent,
                  )
                ],
                onTabSelected: (index) {
                  _fetchProduct(context: context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchBar(),
            ),
            BlocBuilder<ProductListBloc, ProductListState>(
              builder: (context, state) {
                return buildExpanded(state, context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildExpanded(ProductListState state, BuildContext context) {
    return Expanded(
        child: state is ProductListLoadedState
            ? _buildListView(state, context)
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  Widget _buildListView(ProductListLoadedState state, BuildContext context) {
    List<ProductInfo> productInfo = state.productInfo;
    List<Widget> widgets = [
      CarouselWithIndicator(
        images: productInfo
            .map((e) => e.imageUrl)
            .whereType<String>()
            .take(5)
            .toList(),
        height: 100,
      ),
      _animatedContentRow(),
      _typeOfProducts(productInfo),
      CarouselWithIndicator(
        images:
            (productInfo.map((e) => e.imageUrl).whereType<String>().toList())
                .sublist(5, 10),
        height: 50,
      ),
      ProductWithSectionTitle(
        productInfo: productInfo,
        context: context,
        title: "Selling Fast!",
      ),
      ProductWithSectionTitle(
        productInfo: productInfo,
        context: context,
        title: "Top picks in Food & Beverage",
      ),
    ];
    return RefreshIndicator(
      onRefresh: () async {
        _fetchProduct(context: context);
      },
      child: ListView.separated(
        itemBuilder: (context, index) {
          return widgets[index];
        },
        separatorBuilder: (context, index) {
          return const SizedBox();
        },
        itemCount: widgets.length,
      ),
    );
  }

  Padding _animatedContentRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300),
        child: Row(
          children: [
            Expanded(
              child: CustomAnimatedWidget(
                widgets: [
                  buildRowColorTitle(
                      iconData: Icons.wallet_giftcard_sharp,
                      inlineSpan: [
                        TextSpan(
                            text: "BUY MORE\n",
                            style: TextStyle(
                                color: Colors.lightBlue.shade900,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "SAVE MORE",
                            style: TextStyle(
                                color: Colors.orange.shade800,
                                fontSize: 15,
                                fontWeight: FontWeight.bold))
                      ]),
                  buildRowColorTitle(
                      iconData: Icons.shopping_cart,
                      inlineSpan: [
                        TextSpan(
                            text: "WHOLESALE\n",
                            style: TextStyle(
                                color: Colors.lightBlue.shade900,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "MARKET PLACE",
                            style: TextStyle(
                                color: Colors.orange.shade800,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.clip))
                      ]),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRowColorTitle(
                      iconData: Icons.timer,
                      iconSize: 10,
                      inlineSpan: [
                        TextSpan(
                            text: "Fast Delivery",
                            style: TextStyle(
                                color: Colors.lightBlue.shade900,
                                fontSize: 10,
                                fontWeight: FontWeight.normal)),
                      ]),
                  buildRowColorTitle(
                      iconData: Icons.touch_app,
                      iconSize: 10,
                      inlineSpan: [
                        TextSpan(
                            text: "Millions of item",
                            style: TextStyle(
                                color: Colors.lightBlue.shade900,
                                fontSize: 10,
                                fontWeight: FontWeight.normal)),
                      ]),
                  buildRowColorTitle(
                      iconData: Icons.energy_savings_leaf_outlined,
                      iconSize: 10,
                      inlineSpan: [
                        TextSpan(
                            text: "Wholesale Prices",
                            style: TextStyle(
                                color: Colors.lightBlue.shade900,
                                fontSize: 10,
                                fontWeight: FontWeight.normal)),
                      ]),
                  buildRowColorTitle(
                      iconData: Icons.payment,
                      iconSize: 10,
                      inlineSpan: [
                        TextSpan(
                            text: "Multiple Payment Options",
                            style: TextStyle(
                                color: Colors.lightBlue.shade900,
                                fontSize: 10,
                                fontWeight: FontWeight.normal)),
                      ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _typeOfProducts(List<ProductInfo> productInfo) {
    return SizedBox(
        height: 150, // Set height for the horizontal list
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, subIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    _productItem(productInfo[subIndex]),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: const TextStyle(
                                color: Colors.brown, fontSize: 10),
                            text: productInfo[subIndex].name),
                        maxLines: 2, // Limit text to 1 line
                        overflow: TextOverflow.clip,
                      ).paddingOnly(left: 3),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemCount: 10));
  }

  Expanded _productItem(ProductInfo productInfo) {
    return Expanded(
      child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.2), // Shadow color with opacity
                blurRadius: 8.0, // Blur the shadow to make it softer
                spreadRadius: 0.0, // Do not spread the shadow
                offset: const Offset(0,
                    2), // Position the shadow below the container (bottom shadow)
              ),
            ],
          ),
          child: NetworkImageWithLoader(
            imageUrl: productInfo.imageUrl ?? "",
            fit: BoxFit.cover,
          )),
    );
  }

  Widget buildRowColorTitle(
      {required IconData iconData,
      double? iconSize,
      required List<InlineSpan>? inlineSpan}) {
    return Row(
      children: [
        Icon(iconData,
            size: iconSize ?? (inlineSpan?.first.style?.fontSize ?? 0.0) * 1.5,
            color: inlineSpan?.first.style?.color), // Icon
        Expanded(
          child: RichText(
            text: TextSpan(
              children: inlineSpan,
            ),
            maxLines: 2, // Limit text to 1 line
            overflow: TextOverflow.ellipsis,
          ).paddingOnly(left: 3),
        ),
      ],
    );
  }

  Future<void> _fetchProduct({required BuildContext context}) async {
    BlocProvider.of<ProductListBloc>(context).add(ProductListLoadedEvent());
  }
}
