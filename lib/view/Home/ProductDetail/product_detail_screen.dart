// ignore_for_file: use_build_context_synchronously, unused_element

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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatefulWidget {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  Map<String, int?> selectedIndices = {};
  List<ProductVariation> variationData = [];

  void checkSelectedVariations() {
    List<Map<String, String>> selectedAttributes = [];

    if (selectedIndices.length == variationData.first.attributes.length) {
      for (var variationName in selectedIndices.keys) {
        var selectedIndex = selectedIndices[variationName];
        if (selectedIndex != null) {
          var selectedVariation = variationData[selectedIndex];

          Map<String, String> attributesMap = {};
          for (var attribute in selectedVariation.attributes) {
            attributesMap[attribute.attribute.name] = attribute.value;
          }

          attributesMap['price'] = selectedVariation.price.toString();
          attributesMap['discount'] = selectedVariation.discount.toString();

          selectedAttributes.add(attributesMap);
        }
      }

      bool allAttributesSame = _checkIfAllAttributesSame(selectedAttributes);

      if (allAttributesSame) {
        Utils.toastMessage("All variations are available");

        String? selectedPrice = selectedAttributes.first['price'];
        String? selectedDiscount = selectedAttributes.first['discount'];

        widget.product.price = double.tryParse(selectedPrice ?? '0') ?? 0;
        widget.product.discount = double.tryParse(selectedDiscount ?? '0') ?? 0;
      } else {
        Utils.flushBarErrorMessage("Variations are unavailable", context);
      }
    } else {
      Utils.flushBarErrorMessage("Please select all variations", context);
    }
  }

  bool _checkIfAllAttributesSelected() {
    // Check if all attributes are selected for each variation
    for (var variationName in selectedIndices.keys) {
      if (selectedIndices[variationName] == null) {
        return false;
      }
    }
    return true;
  }

  bool _checkIfAllAttributesSame(List<Map<String, String>> attributesList) {
    for (int i = 1; i < attributesList.length; i++) {
      if (!mapEquals(attributesList[0], attributesList[i])) {
        return false;
      }
    }
    return true;
  }

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
    variationData = productVariations;
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
                        if (productVariations.every((variation) =>
                            variation.attributes.any((a) =>
                                a.attribute.name ==
                                attribute.attribute.name))) {
                          String variationName = attribute.attribute.name;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                variationName,
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
                              SizedBox(
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

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (!selectedIndices
                                              .containsKey(variationName)) {
                                            selectedIndices[variationName] =
                                                index;
                                          } else {
                                            int? currentSelectedIndex =
                                                selectedIndices[variationName];

                                            if (currentSelectedIndex == index) {
                                              // Deselect the attribute if tapped again
                                              selectedIndices[variationName] =
                                                  null;
                                            } else {
                                              selectedIndices[variationName] =
                                                  index;
                                            }
                                          }

                                          checkSelectedVariations();
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColor.primaryColor,
                                          ),
                                          color: _getContainerColor(
                                              variationName, index),
                                        ),
                                        child: Text(
                                          "  ${correspondingAttribute.value}  ",
                                          style: const TextStyle(
                                            fontFamily: 'CenturyGothic',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: AppColor.fontColor,
                                          ),
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
                title: "Add to Cart",
                onpress: () async {
                  Future<bool> isInCart =
                      homeRepoProvider.isProductInCart(widget.product.id);

                  if (await isInCart) {
                    Utils.toastMessage("Product is already in the cart");
                  } else if (productVariations.isEmpty) {
                    // If there are no variations, directly save the product to the cart
                    homeRepoProvider.saveCartProducts(widget.product.id,
                        widget.product.title, "image", discountedPrice, 1);
                  } else if (selectedIndices.length ==
                      productVariations.first.attributes.length) {
                    // If all variations are selected, check their availability
                    List<Map<String, String>> selectedAttributes = [];

                    for (var variationName in selectedIndices.keys) {
                      var selectedIndex = selectedIndices[variationName];
                      if (selectedIndex != null) {
                        var selectedVariation = variationData[selectedIndex];

                        Map<String, String> attributesMap = {};
                        for (var attribute in selectedVariation.attributes) {
                          attributesMap[attribute.attribute.name] =
                              attribute.value;
                        }

                        selectedAttributes.add(attributesMap);
                      }
                    }

                    bool allAttributesSame =
                        _checkIfAllAttributesSame(selectedAttributes);

                    if (allAttributesSame) {
                      // Save the product to the cart if all variations are available
                      homeRepoProvider.saveCartProducts(widget.product.id,
                          widget.product.title, "image", discountedPrice, 1);
                    } else {
                      Utils.flushBarErrorMessage(
                          "Variations are unavailable", context);
                    }
                  } else {
                    Utils.flushBarErrorMessage(
                        "Please select all variations", context);
                  }
                },
                color: AppColor.primaryColor,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Color _getContainerColor(String variationName, int index) {
    if (selectedIndices[variationName] == index) {
      return AppColor.primaryColor;
    } else {
      return Colors.transparent;
    }
  }
}
