import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/store/Widgets/store_card.dart';
import 'package:ecommerece/view/store/visit_store.dart';
import 'package:ecommerece/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "Store",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.fontColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.fontColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => const DashBoardScreen(),
              ),
            );
          },
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<HomeRepositoryProvider>(
            builder: (context, homeRepo, child) {
              if (homeRepo.homeRepository.topShops.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: homeRepo.homeRepository.topShops.length,
                  itemBuilder: (context, index) {
                    TopShop shop = homeRepo.homeRepository.topShops[index];
                    return StoreCard(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => VisitStore(
                                      storeName: shop.shopName,
                                      totalRating:
                                          shop.averageRating.toString(),
                                      description: 'This is a great store!',
                                      id: shop.id.toString(),
                                    )));
                      },
                      name: shop.shopName,
                      rating: shop.averageRating.toString(),
                      address: shop.shopAddress,
                      img: "",
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
