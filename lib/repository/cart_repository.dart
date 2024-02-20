import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository extends ChangeNotifier {
  List<Map<String, dynamic>> cartList = [];
  int amount = 1;
  Future<void> getCachedProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Load existing products from cache or create an empty list
      List<String> cachedProducts = prefs.getStringList('products') ?? [];

      // Convert the list of JSON strings to a list of maps
      cartList = cachedProducts.map((productJson) {
        return json.decode(productJson) as Map<String, dynamic>;
      }).toList();

      notifyListeners(); // Notify listeners that the list has been updated
    } catch (e) {
      debugPrint("Error getting cached products: $e");
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      cartList.removeWhere((product) => product['productId'] == productId);

      // Save the updated list to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> updatedProducts =
          cartList.map((product) => json.encode(product)).toList();
      prefs.setStringList('products', updatedProducts);

      notifyListeners(); // Notify listeners that the list has been updated
    } catch (e) {
      debugPrint("Error deleting product: $e");
    }
  }

  void addQuantity() {
    amount++;
    notifyListeners();
  }

  void removeQuantity() {
    amount--;
    notifyListeners();
  }
}
