import 'package:ecommerece/model/preloved_model.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/pro_loved_card.dart';
import 'package:ecommerece/view_model/preloved_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefaultPrelovedSection extends StatelessWidget {
  const DefaultPrelovedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<PrelovedRepositoryProvider>(
        builder: (context, prelovedRepositoryProvider, _) {
          if (prelovedRepositoryProvider
              .prelovedRepository.prelovedProducts.isEmpty) {
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
              itemCount: prelovedRepositoryProvider
                  .prelovedRepository.prelovedProducts.length,
              itemBuilder: (context, index) {
                final PrelovedProduct product = prelovedRepositoryProvider
                    .prelovedRepository.prelovedProducts[index];
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
                  id: product.id,
                  image: product.thumbnailImage,
                  // Add other properties from PrelovedProduct as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
