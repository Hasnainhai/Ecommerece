// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:ecommerece/model/product_detail_model.dart';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetailsRepository extends ChangeNotifier {
  List<ProductDetail> productDetails = [];

  Future<void> fetchProductDetails(
      BuildContext context, String productId) async {
    try {
      final response = await http.get(
        Uri.parse('http://zarozar.exarth.com/web/api/product/$productId/'),
        headers: {
          'accept': 'application/json',
          'X-CSRFToken':
              'DFiCNJXA3vA5lHpCC8FIAhPpG0jorfK2aW1TPklEDwT7BQRgErHFicyis1k927u6',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        ProductDetail productDetail = ProductDetail(
          id: jsonData['id'],
          sku: jsonData['sku'],
          title: jsonData['title'],
          description: jsonData['description'],
          category: Category.fromJson(jsonData['category']),
          vendor: Vendor.fromJson(jsonData['vendor']),
          thumbnailImage: jsonData['thumbnail_image'],
          productVariations:
              parseProductVariations(jsonData['product_variations']),
        );

        // Set the product details property with the fetched data
        productDetails = [productDetail];

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
        Utils.flushBarErrorMessage("Unexpected error occurred", context);
      }
    }
  }

  List<ProductVariation> parseProductVariations(List<dynamic> variationsJson) {
    return variationsJson.map((json) {
      return ProductVariation(
        id: json['id'],
        price: json['price'],
        quantity: json['quantity'],
        discount: json['discount'],
        attributes: parseAttributes(json['attributes']),
      );
    }).toList();
  }

  List<ProductAttribute> parseAttributes(List<dynamic> attributesJson) {
    return attributesJson.map((json) {
      return ProductAttribute(
        id: json['id'],
        value: json['value'],
        name: json['name'],
      );
    }).toList();
  }
}
