// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:ecommerece/model/preloved_model.dart';
import 'package:ecommerece/res/app_url.dart';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrelovedRepository extends ChangeNotifier {
  List<PrelovedProduct> prelovedProducts = [];

  Future<void> fetchPrelovedProducts(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.allPreLovedEndPoint),
        headers: {
          'accept': 'application/json',
          'X-CSRFToken':
              'Pynzu6ykeHzHDuXmXZHX7rNpaJA7B5WfmP6QwHWoOISJTDp0ZiJUPmwiWKBScXGj',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> results = json.decode(response.body)['results'];
        prelovedProducts.clear();
        for (var productJson in results) {
          prelovedProducts.add(PrelovedProduct.fromJson(productJson));
        }

        notifyListeners();
      } else {
        Utils.flushBarErrorMessage("Request failed", context);
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
}
