import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository extends ChangeNotifier {
  List<Map<String, dynamic>> cartList = [];
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
}
