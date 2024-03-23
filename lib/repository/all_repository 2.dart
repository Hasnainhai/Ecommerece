// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/res/app_url.dart';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllProductsRepository extends ChangeNotifier {
  List<Category> categoryList = [];
  List<Products> productList = [];

  Future<void> fetchData(BuildContext context) async {
    const String csrfToken =
        'TmAfyfkTFQr3aZU6ZkVXS1rGw6rMoRPGqDjwAQIXfRK5q8mK1DXUAWazi7sxZJzK';

    try {
      final response = await http.get(
        Uri.parse(AppUrl.productDetailEndPoint),
        headers: {
          'accept': 'application/json',
          'X-CSRFToken': csrfToken,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        categoryList = List<Category>.from(
            data['categories'].map((category) => Category.fromJson(category)));
        productList = List<Products>.from(
            data['products'].map((product) => Products.fromJson(product)));
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
        debugPrint("this is the errror:$e");
        Utils.flushBarErrorMessage("Unexpected error occurred", context);
      }
    }
  }
}
