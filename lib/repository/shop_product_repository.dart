// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:ecommerece/model/shop_products_model.dart';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShopProductRepository extends ChangeNotifier {
  List<ProductShop> productList = [];
  // Your list to store products
  List<ProductShop> searchResults = [];

  Future<void> fetchData(String id, BuildContext context) async {
    final String apiUrl = 'http://zarozar.exarth.com/web/api/shop/$id/product/';

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'accept': 'application/json',
        'X-CSRFToken':
            'NN7zsDs6WFUatMOLtu9Hxob41mLAgkGKk4QQueQawGdcJVgpvNbEfjUXNnMlRcqO',
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        final List<dynamic> productsJson = jsonData['results']['products'];
        productList = productsJson
            .map((product) => ProductShop.fromJson(product))
            .toList();

        print('Fetched data: ${productList}');
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

  void search(
    String searchTerm,
  ) {
    searchResults.clear();

    for (var product in productList) {
      if (product.title.toLowerCase().contains(
            searchTerm.toLowerCase(),
          )) {
        debugPrint("this is search items:${product.toString()}");
        searchResults.add(product);
      }
    }

    if (searchResults.isNotEmpty) {
      notifyListeners();
    }
  }
}
