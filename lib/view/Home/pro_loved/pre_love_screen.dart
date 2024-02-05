import 'package:ecommerece/model/preloved_model.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/pro_loved_card.dart';
import 'package:ecommerece/view/filters/filters.dart';
import 'package:ecommerece/view_model/preloved_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreLoveScreen extends StatefulWidget {
  const PreLoveScreen({super.key});

  @override
  State<PreLoveScreen> createState() => _PreLoveScreenState();
}

class _PreLoveScreenState extends State<PreLoveScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  @override
  void initState() {
    super.initState();
    Provider.of<PrelovedRepositoryProvider>(context, listen: false).getHomeProd(
      context,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "Pro Loved",
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
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: (MediaQuery.of(context).size.width) - 40,
                child: Consumer<PrelovedRepositoryProvider>(
                  builder: (context, preLoved, _) {
                    return TextFormField(
                      controller: searchController,
                      onChanged: (value) {
                        if (searchController.text.length == 3) {
                          setState(() {
                            isSearching = true;
                          });
                        }
                        preLoved.searchAndFetchData(value,
                            preLoved.prelovedRepository.prelovedProducts);
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
              const VerticalSpeacing(20),
              isSearching
                  ? Expanded(
                      child: Consumer<PrelovedRepositoryProvider>(
                        builder: (context, searchRepo, child) {
                          if (searchRepo
                              .prelovedRepository.searchPreloved.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemCount: searchRepo
                                  .prelovedRepository.searchPreloved.length,
                              itemBuilder: (context, index) {
                                PrelovedProduct product = searchRepo
                                    .prelovedRepository.searchPreloved[index];
                                return ProLovedCard(
                                  fun: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.productdetail);
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
                    )
                  : Expanded(
                      child: Consumer<PrelovedRepositoryProvider>(
                        builder: (context, prelovedRepositoryProvider, _) {
                          if (prelovedRepositoryProvider
                              .prelovedRepository.prelovedProducts.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemCount: prelovedRepositoryProvider
                                  .prelovedRepository.prelovedProducts.length,
                              itemBuilder: (context, index) {
                                final PrelovedProduct product =
                                    prelovedRepositoryProvider
                                        .prelovedRepository
                                        .prelovedProducts[index];
                                return ProLovedCard(
                                  fun: () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutesName.preLovedproductdetail,
                                    );
                                  },
                                  name: product.title,
                                  rating: product.averageReview,
                                  price: product.price.toString(),
                                  discount: product.discount.toString(),
                                  // Add other properties from PrelovedProduct as needed
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
    );
  }
}
