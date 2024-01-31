import 'dart:convert';

import 'package:ecommerece/model/home_prod_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeRepository extends ChangeNotifier {
  List<Products> newProducts = [];
  List<Category> productCategories = [];
  List<Products> productsFeature = [];
  List<Products> productsTopDiscount = [];
  List<Products> productsTopOrder = [];
  List<Products> productsTopRated = [];
  Future<void> getHomeProd() async {
    // API endpoint
    const String apiUrl = 'http://zarozar.exarth.com/web/api/home/';
    try {
      // Make GET request
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'accept': 'application/json',
          'X-CSRFToken':
              'DFiCNJXA3vA5lHpCC8FIAhPpG0jorfK2aW1TPklEDwT7BQRgErHFicyis1k927u6',
        },
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse JSON response
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        HomeProdModel homeProdModel = HomeProdModel.fromJson(jsonResponse);

        productCategories = homeProdModel.productCategories;
        productsFeature = homeProdModel.productsFeature.cast<Products>();
        productsTopDiscount = homeProdModel.productsTopDiscount;
        productsTopOrder = homeProdModel.productsTopOrder;
        productsTopRated = homeProdModel.productsTopRated;

        newProducts = homeProdModel.productsNew.cast<Products>();
        print('newProducts: $newProducts');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  String calculateDiscountedPrice(
      double originalPrice, double discountPercentage) {
    double discountedPrice =
        originalPrice - (originalPrice * (discountPercentage / 100));
    return '\$${discountedPrice.toStringAsFixed(2)}';
  }
}
