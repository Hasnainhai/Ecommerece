import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/pro_loved_card.dart';
import 'package:ecommerece/view_model/home_view_model.dart';
import 'package:ecommerece/view_model/service/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefaultSection extends StatelessWidget {
  const DefaultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const VerticalSpeacing(
          12,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          child: Consumer<HomeRepositoryProvider>(
            builder: (context, homeRepo, child) {
              if (homeRepo.homeRepository.productsTopRated.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeRepo.homeRepository.productsTopRated.length,
                  itemExtent: MediaQuery.of(context).size.width / 2.2,
                  itemBuilder: (BuildContext context, int index) {
                    Products product =
                        homeRepo.homeRepository.productsTopRated[index];

                    return ProLovedCard(
                      fun: () {
                        final productDetailsProvider =
                            Provider.of<ProductDetailsRepositoryProvider>(
                                context,
                                listen: false);
                        debugPrint("this is product id:${product.id}");
                        productDetailsProvider.fetchProductDetails(
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
            List<Products> newProducts = homeRepo.homeRepository.newProducts;

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
        const VerticalSpeacing(
          12,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          child: Consumer<HomeRepositoryProvider>(
            builder: (context, homeRepo, child) {
              if (homeRepo.homeRepository.newProducts.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeRepo.homeRepository.newProducts.length,
                  itemExtent: MediaQuery.of(context).size.width / 2.2,
                  itemBuilder: (BuildContext context, int index) {
                    Products product =
                        homeRepo.homeRepository.newProducts[index];

                    return ProLovedCard(
                      fun: () {
                        final productDetailsProvider =
                            Provider.of<ProductDetailsRepositoryProvider>(
                                context,
                                listen: false);
                        debugPrint("this is product id:${product.id}");
                        productDetailsProvider.fetchProductDetails(
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
    );
  }
}
