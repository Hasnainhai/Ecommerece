import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/model/shop_products_model.dart';
import 'package:ecommerece/repository/shop_product_repository.dart';
import 'package:ecommerece/view/Home/widgets/categoryWidget.dart';
import 'package:ecommerece/view/filters/filters.dart';
import 'package:ecommerece/view/store/Widgets/store_detail.dart';
import 'package:ecommerece/view_model/home_view_model.dart';
import 'package:ecommerece/view_model/service/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/components/colors.dart';
import '../../res/components/verticalSpacing.dart';
import '../../utils/routes/routes_name.dart';
import '../Home/pro_loved/Widgets/pro_loved_card.dart';

class VisitStore extends StatefulWidget {
  final String storeName;
  final String totalRating;
  final String description;
  final List<Products> productsTopRated;
  final List<Products> newProducts;
  const VisitStore({
    super.key,
    required this.storeName,
    required this.totalRating,
    required this.description,
    required this.productsTopRated,
    required this.newProducts,
  });

  @override
  State<VisitStore> createState() => _VisitStoreState();
}

class _VisitStoreState extends State<VisitStore> {
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          "Store Detail",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.whiteColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
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
                      const VerticalSpeacing(
                        12,
                      ),
                      StoreDetailCard(
                        shopName: widget.storeName,
                        rating: widget.totalRating,
                        discription: widget.description,
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpeacing(27.0),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: isSearch
                    ? Column(
                        children: [
                          const VerticalSpeacing(16.0),
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
                            height: MediaQuery.of(context).size.height / 1.5,
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
                    : Column(
                        children: [
                          // const VerticalSpeacing(16.0),
                          const Row(
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
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CategoryCart('All'),
                                CategoryCart('Jakits'),
                                CategoryCart('Shirt'),
                                CategoryCart('Woman'),
                                CategoryCart('Jakits'),
                                CategoryCart('Shirt'),
                                CategoryCart('Woman'),
                              ],
                            ),
                          ),
                          Row(
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
                                    arguments: widget.productsTopRated,
                                  );
                                },
                                child: const Text(
                                  'see more',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'CenturyGothic',
                                      color: AppColor.fontColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpeacing(27.0),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                            child: Consumer<ShopProductRepository>(
                              builder: (context, shopRepo, child) {
                                if (shopRepo.productList.isEmpty) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: shopRepo.productList.length,
                                    itemExtent:
                                        MediaQuery.of(context).size.width / 2.2,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      ProductShop product =
                                          shopRepo.productList[index];

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'New T Shirts',
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
                                    arguments: widget.newProducts,
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
                          ),
                          const VerticalSpeacing(16.0),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2.3,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0,
                              ),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                Products product = widget.newProducts[index];
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
                            ),
                          ),
                          const VerticalSpeacing(40.0),
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
