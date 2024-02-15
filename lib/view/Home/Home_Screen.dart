import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/ProductDetail/product_detail_screen.dart';
import 'package:ecommerece/view/Home/widgets/categoryWidget.dart';
import 'package:ecommerece/view/filters/filters.dart';
import 'package:ecommerece/view_model/service/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';
import 'pro_loved/Widgets/pro_loved_card.dart';
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
                            if (searchController.text.length == 3) {
                              setState(() {
                                isSearch = true;
                              });
                            }
                            viewModel.search(
                                value,
                                viewModel.homeRepository.productsTopRated,
                                viewModel.homeRepository.newProducts);
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
                            'Store',
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
                      Text(
                        'see more',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'CenturyGothic',
                            color: AppColor.fontColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const VerticalSpeacing(16.0),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
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
                  isSearch
                      ? Column(
                          children: [
                            Consumer<HomeRepositoryProvider>(
                              builder: (context, homeRepo, child) {
                                List<Products> newProducts =
                                    homeRepo.homeRepository.productsTopRated;

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Search Products',
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
                                          RoutesName.popularsScreen,
                                          arguments: newProducts,
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
                            const VerticalSpeacing(
                              12,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.width,
                              child: Consumer<HomeRepositoryProvider>(
                                builder: (context, homeRepo, child) {
                                  if (homeRepo
                                      .homeRepository.searchResults.isEmpty) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return GridView.builder(
                                      scrollDirection: Axis.vertical,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, // Number of columns
                                        crossAxisSpacing:
                                            8.0, // Spacing between columns
                                        mainAxisSpacing:
                                            8.0, // Spacing between rows
                                        childAspectRatio:
                                            1.0, // Width to height ratio of each grid item
                                      ),
                                      itemCount: homeRepo
                                          .homeRepository.searchResults.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Products product = homeRepo
                                            .homeRepository
                                            .searchResults[index];

                                        return ProLovedCard(
                                          fun: () {
                                            final productDetailsProvider = Provider
                                                .of<ProductDetailsRepositoryProvider>(
                                                    context,
                                                    listen: false);
                                            debugPrint(
                                                "this is product id:${product.id}");
                                            productDetailsProvider
                                                .fetchProductDetails(
                                              context,
                                              product.id,
                                            );
                                          },
                                          name: product.title,
                                          rating: product.averageReview,
                                          price: product.price.toString(),
                                          discount: product.discount.toString(),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Consumer<HomeRepositoryProvider>(
                              builder: (context, homeRepo, child) {
                                List<Products> newProducts =
                                    homeRepo.homeRepository.productsTopRated;

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Populars',
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
                                          RoutesName.popularsScreen,
                                          arguments: newProducts,
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
                            const VerticalSpeacing(
                              12,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
                              child: Consumer<HomeRepositoryProvider>(
                                builder: (context, homeRepo, child) {
                                  if (homeRepo.homeRepository.productsTopRated
                                      .isEmpty) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: homeRepo.homeRepository
                                          .productsTopRated.length,
                                      itemExtent:
                                          MediaQuery.of(context).size.width /
                                              2.2,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Products product = homeRepo
                                            .homeRepository
                                            .productsTopRated[index];

                                        return ProLovedCard(
                                          fun: () {
                                            final productDetailsProvider = Provider
                                                .of<ProductDetailsRepositoryProvider>(
                                                    context,
                                                    listen: false);
                                            debugPrint(
                                                "this is product id:${product.id}");
                                            productDetailsProvider
                                                .fetchProductDetails(
                                              context,
                                              product.id,
                                            );
                                          },
                                          name: product.title,
                                          rating: product.averageReview,
                                          price: product.price.toString(),
                                          discount: product.discount.toString(),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            const VerticalSpeacing(20.0),
                            Consumer<HomeRepositoryProvider>(
                              builder: (context, homeRepo, child) {
                                List<Products> newProducts =
                                    homeRepo.homeRepository.newProducts;

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Our new items',
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
                                          RoutesName.newItemsScreen,
                                          arguments: newProducts,
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
                            const VerticalSpeacing(
                              12,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
                              child: Consumer<HomeRepositoryProvider>(
                                builder: (context, homeRepo, child) {
                                  if (homeRepo
                                      .homeRepository.newProducts.isEmpty) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: homeRepo
                                          .homeRepository.newProducts.length,
                                      itemExtent:
                                          MediaQuery.of(context).size.width /
                                              2.2,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Products product = homeRepo
                                            .homeRepository.newProducts[index];

                                        return ProLovedCard(
                                          fun: () {
                                            final productDetailsProvider = Provider
                                                .of<ProductDetailsRepositoryProvider>(
                                                    context,
                                                    listen: false);
                                            debugPrint(
                                                "this is product id:${product.id}");
                                            productDetailsProvider
                                                .fetchProductDetails(
                                              context,
                                              product.id,
                                            );
                                          },
                                          name: product.title,
                                          rating: product.averageReview,
                                          price: product.price.toString(),
                                          discount: product.discount.toString(),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            const VerticalSpeacing(30.0),
                          ],
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
