import 'dart:convert';

import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/repository/home_repository.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepositoryProvider extends ChangeNotifier {
  HomeRepository _homeRepository = HomeRepository();

  HomeRepository get homeRepository => _homeRepository;

  Future<void> getHomeProd(BuildContext context) async {
    await _homeRepository.getHomeProd(context);
    notifyListeners();
  }

  String calculateDiscountedPrice(double originalPrice, double discount) {
    String discountedPrice =
        _homeRepository.calculateDiscountedPrice(originalPrice, discount);
    notifyListeners();
    return discountedPrice;
  }

  void search(
    String searchTerm,
    List<Products> produtTopRated,
    List<Products> productsNew,
    List<Products> productsFeature,
    List<Products> productsTopDiscount,
    List<Products> productsTopOrder,
  ) {
    _homeRepository.search(
      searchTerm,
      produtTopRated,
      productsNew,
      productsFeature,
      productsTopDiscount,
      productsTopOrder,
    );
    notifyListeners();
  }

  void categoryFilter(
    String categrio,
  ) {
    _homeRepository.categoryFilter(categrio);
    notifyListeners();
  }

  void filterProducts(
    String? categrio,
    double? mixRating,
    double? minPrice,
    double? maxPrice,
  ) {
    _homeRepository.filterProducts(
      categrio,
      mixRating,
      minPrice,
      maxPrice,
    );
    notifyListeners();
  }

  void saveCartProducts(
    String productId,
    String name,
    String image,
    String price,
    int quantity,
  ) {
    _homeRepository.saveProductToCache(
      productId: productId,
      name: name,
      image: image,
      price: price,
      quantity: quantity,
    );
    notifyListeners();
  }

  Future<bool> isProductInCart(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cachedProducts = prefs.getStringList('products') ?? [];

    // Check if the product is in the list
    return cachedProducts.any((productJson) {
      Map<String, dynamic> existingProduct =
          json.decode(productJson) as Map<String, dynamic>;
      return existingProduct['productId'] == productId;
    });
  }
}
