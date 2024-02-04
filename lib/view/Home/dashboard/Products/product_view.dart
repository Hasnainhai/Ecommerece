import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/pro_loved_card.dart';
import 'package:ecommerece/view/filters/filters.dart';
import 'package:ecommerece/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: const Text(
          "Product",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w300,
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
          padding: const EdgeInsets.all(
            20,
          ),
          child: isSearch
              ? Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: (MediaQuery.of(context).size.width) - 40,
                      child: Consumer<HomeRepositoryProvider>(
                        builder: (context, searchModel, _) {
                          return TextFormField(
                            controller: searchController,
                            onChanged: (value) {
                              if (searchController.text.length == 3) {
                                setState(() {
                                  isSearch = true;
                                });
                              }
                              searchModel.search(
                                value,
                                searchModel.homeRepository.productsTopRated,
                                searchModel.homeRepository.newProducts,
                              );
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
                        List<Products> newProducts =
                            homeRepo.homeRepository.productsTopRated;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Expanded(
                      child: Consumer<HomeRepositoryProvider>(
                        builder: (context, homeRepo, child) {
                          if (homeRepo.homeRepository.searchResults.isEmpty) {
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
                                mainAxisSpacing: 8.0, // Spacing between rows
                                childAspectRatio:
                                    1.0, // Width to height ratio of each grid item
                              ),
                              itemCount:
                                  homeRepo.homeRepository.searchResults.length,
                              itemBuilder: (BuildContext context, int index) {
                                Products product = homeRepo
                                    .homeRepository.searchResults[index];

                                return ProLovedCard(
                                  fun: () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutesName.productdetail,
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
              : SingleChildScrollView(
                  child: Column(
                    children: [
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
                                helperStyle: const TextStyle(
                                    color: AppColor.fieldBgColor),
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
                                        builder: (context) =>
                                            const FilterPopUp(),
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
                          List<Products> newProducts =
                              homeRepo.homeRepository.productsTopRated;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const VerticalSpeacing(14),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.3,
                        child: Consumer<HomeRepositoryProvider>(
                          builder: (context, homeRepo, child) {
                            if (homeRepo
                                .homeRepository.productsTopRated.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  Products product = homeRepo
                                      .homeRepository.productsTopRated[index];
                                  return ProLovedCard(
                                    price: product.price.toString(),
                                    discount: product.discount.toString(),
                                    name: product.title,
                                    rating: product.averageReview,
                                    fun: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesName.productdetail,
                                      );
                                    },
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                      const VerticalSpeacing(16),
                      Consumer<HomeRepositoryProvider>(
                        builder: (context, homeRepo, child) {
                          List<Products> newProducts =
                              homeRepo.homeRepository.newProducts;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const VerticalSpeacing(14),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.3,
                        child: Consumer<HomeRepositoryProvider>(
                          builder: (context, homeRepo, child) {
                            if (homeRepo.homeRepository.newProducts.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  Products product = homeRepo
                                      .homeRepository.newProducts[index];
                                  return ProLovedCard(
                                    price: product.price.toString(),
                                    discount: product.discount.toString(),
                                    name: product.title,
                                    rating: product.averageReview,
                                    fun: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesName.productdetail,
                                      );
                                    },
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
