import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/model/product_detail_model.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:ecommerece/view/Home/PreLovedProductDetail/Widget/image_slider.dart';

import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/pro_loved_card.dart';
import 'package:ecommerece/view_model/home_view_model.dart';
import 'package:ecommerece/view_model/service/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatefulWidget {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeRepositoryProvider homeRepoProvider =
        Provider.of<HomeRepositoryProvider>(context, listen: false);
    ProductDetailsRepositoryProvider productDetailProvider =
        Provider.of<ProductDetailsRepositoryProvider>(context, listen: false);
    List<ProductVariation> productVariations =
        productDetailProvider.productDetailsRepository.productVariationsList;

    // Calculate discounted price using the HomeRepositoryProvider
    double originalPrice = double.parse(widget.product.price.toString());
    double originalDiscount = double.parse(widget.product.discount.toString());

    String discountedPrice = homeRepoProvider.homeRepository
        .calculateDiscountedPrice(originalPrice, originalDiscount);
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: const Text(
          "Product Details",
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
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const ImageSlider(),
              const VerticalSpeacing(30),
              Text(
                widget.product.title,
                style: const TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(10),
              Row(
                children: [
                  Text(
                    "\$${widget.product.price}",
                    style: const TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontColor,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    discountedPrice,
                    style: const TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(16),
              const Text(
                "Product Details",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryColor,
                ),
              ),
              const VerticalSpeacing(12),
              Text(
                widget.product.description,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(
                20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.totalreview,
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Review",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.fontColor,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.navigate_next,
                          size: 28,
                          color: Color(0xff222222),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const VerticalSpeacing(
                20,
              ),
              const Divider(
                color: Color(0xffBCBCBC),
              ),
              const VerticalSpeacing(
                24,
              ),
              productVariations.isEmpty
                  ? const SizedBox()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          productVariations.first.attributes.map((attribute) {
                        // Check if the attribute exists in all variations
                        if (productVariations.every((variation) =>
                            variation.attributes.any((a) =>
                                a.attribute.name ==
                                attribute.attribute.name))) {
                          // Show the name
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${attribute.attribute.name}",
                                style: const TextStyle(
                                  fontFamily: 'CenturyGothic',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.fontColor,
                                ),
                              ),
                              // Add vertical spacing
                              const VerticalSpeacing(18),
                              // Show all corresponding values with horizontal scrolling
                              Container(
                                height:
                                    30, // Set a fixed height or adjust as needed
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productVariations.length,
                                  itemBuilder: (context, index) {
                                    var correspondingAttribute =
                                        productVariations[index]
                                            .attributes
                                            .firstWhere((a) =>
                                                a.attribute.name ==
                                                attribute.attribute.name);
                                    return Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.primaryColor)),
                                      child: Text(
                                        "  ${correspondingAttribute.value}  ",
                                        style: const TextStyle(
                                          fontFamily: 'CenturyGothic',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: AppColor.fontColor,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              // Add vertical spacing
                              const VerticalSpeacing(18),
                            ],
                          );
                        } else {
                          return const SizedBox(); // Don't show if the attribute is missing in any variation
                        }
                      }).toList(),
                    ),
              const VerticalSpeacing(
                20,
              ),
              const Divider(
                color: Color(0xffBCBCBC),
              ),
              const VerticalSpeacing(
                16,
              ),
              const Text(
                "Related product",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(
                10,
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
                        itemCount:
                            homeRepo.homeRepository.productsTopRated.length,
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
              const VerticalSpeacing(
                40,
              ),
              RoundedButton(
                title: "Add to card",
                onpress: () async {
                  Future<bool> isInCart =
                      homeRepoProvider.isProductInCart(widget.product.id);

                  if (await isInCart) {
                    Utils.toastMessage("Product is already in the cart");
                  } else {
                    homeRepoProvider.saveCartProducts(widget.product.id,
                        widget.product.title, "image", discountedPrice, 1);
                  }
                },
                color: AppColor.primaryColor,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
