// ignore_for_file:
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/view/Home/cart/cartScreen.dart';
import 'package:ecommerece/view/Home/dashboard/Products/product_view.dart';
import 'package:ecommerece/view/Home/save/Widgets/favouriteScreen.dart';
import 'package:ecommerece/view/Home/pro_loved/pre_love_screen.dart';
import 'package:ecommerece/view/store/store.dart';
import 'package:flutter/material.dart';

import '../Home_Screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectIndex = 0;
  onItemClick(int index) {
    setState(() {
      selectIndex = index;
      tabController!.index = selectIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeScreen(),
          StoreScreen(),
          PreLoveScreen(),
          CartScreen(),
          FavouriteScreen(),
          Product(),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: ('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.store_outlined,
                ),
                label: ('Shop'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: ('Pro Loved')),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: ('Cart'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border,
                ),
                label: ('Save'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    // Icons.account_circle,
                    Icons.token_outlined),
                label: ('Product'),
              ),
            ],
            unselectedItemColor: Colors.black,
            selectedItemColor: AppColor.primaryColor,
            backgroundColor: AppColor.fieldBgColor,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            currentIndex: selectIndex,
            onTap: onItemClick,
            selectedFontSize: 12,
            unselectedFontSize: 10,
          ),
        ],
      ),
    );
  }
}
