// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:ecommerece/model/product_detail_model.dart';
import 'package:ecommerece/res/app_url.dart';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:ecommerece/view/Home/ProductDetail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetailsRepository extends ChangeNotifier {
  Product? product;

  Future<void> fetchProductDetails(
      BuildContext context, String productId) async {
    try {
      final response = await http.get(
        Uri.parse('${AppUrl.productDetailEndPoint}$productId/'),
        headers: {
          'accept': 'application/json',
          'X-CSRFToken':
              'DFiCNJXA3vA5lHpCC8FIAhPpG0jorfK2aW1TPklEDwT7BQRgErHFicyis1k927u6',
        },
      );

      if (response.statusCode == 200) {
        debugPrint("this is json response: ${response.body}");
        final Map<String, dynamic> jsonData = json.decode(response.body);
        debugPrint("this is json data: $jsonData");

        product = Product.fromJson(jsonData);

        if (product != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => ProductDetailView(
                product: product!,
              ),
            ),
          );
        } else {
          Utils.flushBarErrorMessage("Product is null", context);
        }

        notifyListeners();
      } else {
        if (response.statusCode == 404) {
          Utils.flushBarErrorMessage("Product not found", context);
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
        debugPrint("this is the error: $e");
        Utils.flushBarErrorMessage("Unexpected error occurred", context);
      }
    }
  }
}
