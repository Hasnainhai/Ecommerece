import 'package:ecommerece/model/preloved_model.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/pro_loved_card.dart';
import 'package:ecommerece/view_model/preloved_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPreLovedSection extends StatelessWidget {
  const SearchPreLovedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<PrelovedRepositoryProvider>(
        builder: (context, searchRepo, child) {
          if (searchRepo.prelovedRepository.searchPreloved.isEmpty) {
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
              itemCount: searchRepo.prelovedRepository.searchPreloved.length,
              itemBuilder: (context, index) {
                PrelovedProduct product =
                    searchRepo.prelovedRepository.searchPreloved[index];
                return ProLovedCard(
                  fun: () {
                    Navigator.pushNamed(context, RoutesName.productdetail);
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
    );
  }
}
