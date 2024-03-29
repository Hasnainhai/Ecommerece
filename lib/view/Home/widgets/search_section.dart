import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/pro_loved_card.dart';
import 'package:ecommerece/view_model/home_view_model.dart';
import 'package:ecommerece/view_model/service/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

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
              if (homeRepo.homeRepository.searchResults.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 8.0, // Spacing between columns
                    mainAxisSpacing: 8.0, // Spacing between rows
                    childAspectRatio:
                        1.0, // Width to height ratio of each grid item
                  ),
                  itemCount: homeRepo.homeRepository.searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    Products product =
                        homeRepo.homeRepository.searchResults[index];

                    return ProLovedCard(
                      fun: () {
                        final productDetailsProvider =
                            Provider.of<ProductDetailsRepositoryProvider>(
                                context,
                                listen: false);
                        productDetailsProvider.fetchProductDetails(
                          context,
                          product.id,
                        );
                      },
                      name: product.title,
                      rating: product.averageReview,
                      price: product.price.toString(),
                      discount: product.discount.toString(),
                      id: product.id,
                      image: product.thumbnailImage,
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
