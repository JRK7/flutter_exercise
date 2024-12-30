import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/Utils/constant.dart';
import 'package:flutter_exercise/ViewModel/CartViewModel/cart_bloc.dart';
import 'package:flutter_exercise/ViewModel/TabViewModel/Bloc/tab_selection_bloc.dart';
import 'package:flutter_exercise/Views/CustomViews/CustomText.dart';
import 'package:flutter_exercise/Views/ProductListPage/search_product_list_page.dart';
import 'package:flutter_exercise/Views/ProfilePage/profile_page.dart';

import 'CartPage/cart_page.dart';
import 'ShopPage/shop_page.dart';

class GuestDashboard extends StatelessWidget {
  GuestDashboard({super.key});

  final pages = [
    const ShopPage(),
    const SearchProductListPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CartBloc(),
        child: _container(),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: TabBar(
          dividerColor: Colors.transparent,
          onTap: (index) {
            BlocProvider.of<TabSelectionBloc>(context)
                .add(TabSelectionEvent(index));
          },
          tabs: [
            Tab(
                child:
                    _tabWidget(icon: Icons.explore, text: CommonConstant.shop)),
            Tab(
                child: _tabWidget(
                    icon: Icons.search, text: CommonConstant.categories)),
            Tab(
                child: _tabWidget(
                    icon: Icons.local_offer, text: CommonConstant.carts)),
            Tab(
                child:
                    _tabWidget(icon: Icons.person, text: CommonConstant.you)),
          ],
          indicator: const BoxDecoration(
            color: Colors.transparent,
            // Color of the indicator
            border: Border(
              top: BorderSide(
                  color: Colors.red,
                  width: 4.0), // Move the indicator to the top
            ),
            // Modify indicator position to the top of the tab by setting a top border
          ),
        ),
      ),
    );
  }

  Widget _tabWidget({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Icon(icon),
          CustomText(
            title: text,
            overflow: TextOverflow.visible,
            fontSize: 10,
          ),
        ],
      ),
    );
  }

  Widget _container() {
    return BlocBuilder<TabSelectionBloc, TabSelectionState>(
      builder: (_, state) {
        return pages[state.index];
      },
    );
  }
}
