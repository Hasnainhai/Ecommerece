// ignore_for_file: prefer_is_empty

import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/repository/home_ui_repository.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/res/enums.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/widgets/categoryWidget.dart';
import 'package:ecommerece/view/Home/widgets/category_products.dart';
import 'package:ecommerece/view/Home/widgets/default_section.dart';
import 'package:ecommerece/view/Home/widgets/filter_products.dart';
import 'package:ecommerece/view/Home/widgets/search_section.dart';
import 'package:ecommerece/view/filters/filters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';
import 'widgets/storeWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  @override
  void initState() {
    super.initState();
    Provider.of<HomeRepositoryProvider>(context, listen: false).getHomeProd(
      context,
    );
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpeacing(20.0),
                  ListTile(
                    horizontalTitleGap: 16.0,
                    leading: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.profile,
                        );
                      },
                      child: const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/474x/e7/a9/4b/e7a94b352d281a23d847a13352be652c.jpg',
                            scale: 0.1),
                      ),
                    ),
                    title: const Text(
                      'Wellcome',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: AppColor.fontColor,
                          fontFamily: 'CenturyGothic'),
                    ),
                    subtitle: const Text(
                      'Rayees khan',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: AppColor.fontColor,
                          fontFamily: 'CenturyGothic'),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.notification);
                        },
                        icon: const Icon(
                          Icons.notifications_rounded,
                          color: AppColor.blackColor,
                          size: 30.0,
                        )),
                  ),
                  const VerticalSpeacing(27.0),
                  SizedBox(
                    height: 60,
                    width: (MediaQuery.of(context).size.width) - 40,
                    child: Consumer<HomeRepositoryProvider>(
                      builder: (context, viewModel, _) {
                        return TextFormField(
                          controller: searchController,
                          onChanged: (value) {
                            if (searchController.text.length >= 1) {
                              viewModel.search(
                                value,
                                viewModel.homeRepository.productsTopRated,
                                viewModel.homeRepository.newProducts,
                                viewModel.homeRepository.productsFeature,
                                viewModel.homeRepository.productsTopDiscount,
                                viewModel.homeRepository.productsTopOrder,
                              );
                              Provider.of<HomeUiSwithchRepository>(context,
                                      listen: false)
                                  .switchToType(UIType.SearchSection);
                            } else {
                              Provider.of<HomeUiSwithchRepository>(context,
                                      listen: false)
                                  .switchToType(UIType.DefaultSection);
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Search Here",
                            helperStyle:
                                const TextStyle(color: AppColor.fieldBgColor),
                            filled: true,
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.search,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FilterPopUp(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.tune_sharp,
                                color: AppColor.fontColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Consumer<HomeRepositoryProvider>(
                    builder: (context, homeRepo, child) {
                      List<TopShop> topShop = homeRepo.homeRepository.topShops;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Top Stores',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'CenturyGothic',
                              color: AppColor.fontColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.storeScreen,
                                arguments: topShop,
                              );
                            },
                            child: const Text(
                              'see more',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'CenturyGothic',
                                color: AppColor.fontColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Consumer<HomeRepositoryProvider>(
                      builder: (context, homeRepo, child) {
                        if (homeRepo.homeRepository.topShops.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              TopShop shop =
                                  homeRepo.homeRepository.topShops[index];

                              return StoreWidget(
                                title: shop.shopName,
                                img: '',
                                rating: shop.averageRating.toString(),
                                address: shop.shopAddress.length > 15
                                    ? '${shop.shopAddress.substring(0, 27)}...'
                                    : shop.shopAddress,
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'CenturyGothic',
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpeacing(16.0),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 9,
                    child: Consumer<HomeRepositoryProvider>(
                      builder: (context, homeRepo, child) {
                        if (homeRepo.homeRepository.productCategories.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homeRepo
                                .homeRepository.productCategories.length,
                            itemExtent: MediaQuery.of(context).size.width / 3.6,
                            itemBuilder: (BuildContext context, int index) {
                              Category category = homeRepo
                                  .homeRepository.productCategories[index];

                              return CategoryCart(category.name);
                            },
                          );
                        }
                      },
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Consumer<HomeUiSwithchRepository>(
                    builder: (context, uiState, _) {
                      Widget selectedWidget;

                      switch (uiState.selectedType) {
                        case UIType.SearchSection:
                          selectedWidget = const SearchSection();
                          break;
                        case UIType.FilterSection:
                          selectedWidget = const FilterProducts();
                          break;
                        case UIType.CategoriesSection:
                          selectedWidget = const CategoriesSection();
                          break;
                        case UIType.DefaultSection:
                          selectedWidget = const DefaultSection();
                          break;
                      }

                      return selectedWidget;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
