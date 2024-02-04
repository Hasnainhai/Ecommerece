import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/view/Home/widgets/categoryWidget.dart';
import 'package:ecommerece/view/store/Widgets/store_detail.dart';
import 'package:flutter/material.dart';

import '../../res/components/colors.dart';
import '../../res/components/verticalSpacing.dart';
import '../../utils/routes/routes_name.dart';
import '../Home/pro_loved/Widgets/pro_loved_card.dart';

class VisitStore extends StatelessWidget {
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
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search",
                            helperStyle: TextStyle(color: AppColor.whiteColor),
                            fillColor: AppColor.whiteColor,
                            filled: true,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            suffixIcon: Icon(
                              Icons.tune_sharp,
                              color: AppColor.fontColor,
                            ),
                          ),
                        ),
                      ),
                      const VerticalSpeacing(
                        12,
                      ),
                      StoreDetailCard(
                        shopName: storeName,
                        rating: totalRating,
                        discription: description,
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
                child: Column(
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
                              arguments: productsTopRated,
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
                          Products product = productsTopRated[index];
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
                          Products product = productsTopRated[index];
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
