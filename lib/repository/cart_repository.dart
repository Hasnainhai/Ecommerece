// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository extends ChangeNotifier {
  List<Map<String, dynamic>> cartList = [];
  int amount = 1;
  Future<void> getCachedProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String> cachedProducts = prefs.getStringList('products') ?? [];

      cartList = cachedProducts.map((productJson) {
        return json.decode(productJson) as Map<String, dynamic>;
      }).toList();

      notifyListeners();
    } catch (e) {
      debugPrint("Error getting cached products: $e");
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      cartList.removeWhere((product) => product['productId'] == productId);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> updatedProducts =
          cartList.map((product) => json.encode(product)).toList();
      prefs.setStringList('products', updatedProducts);

      notifyListeners();
    } catch (e) {
      debugPrint("Error deleting product: $e");
    }
  }

  void addQuantity(String productId) {
    Map<String, dynamic>? product = cartList.firstWhere(
      (item) => item['productId'] == productId,
      orElse: () => <String, dynamic>{},
    );

    if (product != null) {
      int currentQuantity = product['quantity'] ?? 1;
      int newQuantity = currentQuantity + 1;
      product['quantity'] = newQuantity;

      double price = double.tryParse(product['price'] ?? '0.0') ?? 0.0;
      double individualTotal = price * newQuantity;
      product['individualTotal'] = individualTotal.toString();

      notifyListeners();
    }
  }

  void removeQuantity(String productId) {
    Map<String, dynamic>? product = cartList.firstWhere(
      (item) => item['productId'] == productId,
      orElse: () => <String, dynamic>{},
    );

    if (product != null && (product['quantity'] ?? 1) > 1) {
      int quantity = (product['quantity'] ?? 1) - 1;
      product['quantity'] = quantity;

      double price = double.tryParse(product['price'] ?? '0.0') ?? 0.0;
      double individualTotal = price * quantity;
      product['individualTotal'] = individualTotal.toString();

      notifyListeners();
    }
  }
}
