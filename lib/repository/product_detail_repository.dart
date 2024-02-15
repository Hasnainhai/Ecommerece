// ignore_for_file: use_build_context_synchronously

import 'package:ecommerece/res/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:ecommerece/model/product_detail_model.dart';

class ProductDetailsRepository extends ChangeNotifier {
  ProductDetail? productDetail;
  List<ProductVariation> productVariations = [];
  List<ProductAttribute> productAttributes = [];

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
        debugPrint("this is jason response:${response.body}");
        final Map<String, dynamic> jsonData = json.decode(response.body);
        debugPrint("this is jason data:$jsonData");

        productDetail = ProductDetail(
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

        productVariations =
            parseProductVariations(jsonData['product_variations']);
        productAttributes = parseAttributes(jsonData['attributes']);

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
        debugPrint("this is the error:$e");
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
