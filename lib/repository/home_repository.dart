// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/res/app_url.dart';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository extends ChangeNotifier {
  List<Products> newProducts = [];
  List<Category> productCategories = [];
  List<Products> productsFeature = [];
  List<Products> productsTopDiscount = [];
  List<Products> productsTopOrder = [];
  List<Products> productsTopRated = [];
  List<TopShop> topShops = [];
  List<Products> searchResults = [];
  List<Products> categriousProduct = [];
  List<Products> filteredProducts = [];

  Future<void> getHomeProd(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.allProdEndPoint),
        headers: {
          'accept': 'application/json',
          'X-CSRFToken':
              'DFiCNJXA3vA5lHpCC8FIAhPpG0jorfK2aW1TPklEDwT7BQRgErHFicyis1k927u6',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        HomeProdModel homeProdModel = HomeProdModel.fromJson(jsonResponse);

        productCategories = homeProdModel.productCategories;
        productsFeature = homeProdModel.productsFeature;
        productsTopDiscount = homeProdModel.productsTopDiscount;
        productsTopOrder = homeProdModel.productsTopOrder;
        productsTopRated = homeProdModel.productsTopRated;
        topShops = homeProdModel.topShops;
        newProducts = homeProdModel.productsNew;

        notifyListeners();
      } else {
        if (response.statusCode == 404) {
          Utils.flushBarErrorMessage("Products not found", context);
        } else {
          Utils.flushBarErrorMessage("Unexpected error", context);
        }
      }
    } catch (e) {
      if (e is SocketException) {
        Utils.flushBarErrorMessage(
            "Network error. Check your internet connection.", context);
      } else if (e is FormatException) {
        Utils.flushBarErrorMessage("Invalid response format", context);
      } else {
        Utils.flushBarErrorMessage("Unexpected error occurred", context);
      }
    }
  }

  String calculateDiscountedPrice(
      double originalPrice, double discountPercentage) {
    double discountedPrice =
        originalPrice - (originalPrice * (discountPercentage / 100));
    return discountedPrice.toStringAsFixed(2);
  }

  void search(
    String searchTerm,
    List<Products> productsTopRated,
    List<Products> productsNew,
  ) {
    searchResults.clear();

    for (var product in productsTopRated) {
      if (product.title.toLowerCase().contains(searchTerm.toLowerCase())) {
        searchResults.add(product);
      }
    }

    for (var product in newProducts) {
      if (product.title.toLowerCase().contains(searchTerm.toLowerCase())) {
        searchResults.add(product);
      }
    }

    if (searchResults.isNotEmpty) {
      notifyListeners();
    }
  }

  void categoryFilter(String category) {
    categriousProduct.clear();
    for (var product in productsTopRated) {
      if (product.category.name.toLowerCase().contains(
            category.toLowerCase(),
          )) {
        categriousProduct.add(product);
      }
    }
    for (var product in newProducts) {
      if (product.category.name.toLowerCase().contains(
            category.toLowerCase(),
          )) {
        categriousProduct.add(product);
      }
    }

    if (categriousProduct.isNotEmpty) {
      notifyListeners();
    }
  }

  void filterProducts(
    String category,
    double minRating,
    double minPrice,
    double maxPrice,
  ) {
    try {
      filteredProducts.clear();
      for (var product in productsTopRated) {
        if (product.category.name.toLowerCase().contains(
              category.toLowerCase(),
            )) {
          filteredProducts.add(product);
        }
      }
      for (var product in newProducts) {
        if (product.category.name.toLowerCase().contains(
              category.toLowerCase(),
            )) {
          filteredProducts.add(product);
        }
      }
      filteredProducts
          .removeWhere((product) => product.averageReview < minRating);
      filteredProducts.removeWhere(
        (product) => product.price < minPrice || product.price > maxPrice,
      );
      notifyListeners();
    } catch (e) {
      debugPrint("this is error in the filter product:${e.toString()} ");
    }
  }

  Future<void> saveProductToCache({
    required String productId,
    required String name,
    required String image,
    required String price,
    required int quantity,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map<String, dynamic> newProduct = {
        'productId': productId,
        'name': name,
        'image': image,
        'price': price,
        'quantity': quantity,
      };

      String newProductJson = json.encode(newProduct);

      List<String> cachedProducts = prefs.getStringList('products') ?? [];

      cachedProducts.add(newProductJson);

      prefs.setStringList('products', cachedProducts);
      Utils.toastMessage("Product has been added to cart");
      notifyListeners();
    } catch (e) {
      debugPrint("Error saving product to cache: $e");
    }
  }

  Future<bool> isProductInCart(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cachedProducts = prefs.getStringList('products') ?? [];

    for (String productJson in cachedProducts) {
      Map<String, dynamic> productMap = json.decode(productJson);
      if (productMap['productId'] == productId) {
        return true;
      }
    }

    return false;
  }
}
