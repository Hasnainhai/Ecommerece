import 'dart:convert';

import 'package:ecommerece/utils/routes/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveRepository extends ChangeNotifier {
  List<Map<String, dynamic>> saveList = [];

  Future<void> saveProductToSave({
    required String productId,
    required String name,
    required String image,
    required String price,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map<String, dynamic> newProduct = {
        'productId': productId,
        'name': name,
        'image': image,
        'price': price,
      };

      String newProductJson = json.encode(newProduct);

      List<String> saveProducts = prefs.getStringList('SaveProducts') ?? [];
      debugPrint(
          "this is existing list:${prefs.getStringList('SaveProducts') ?? []}");
      saveProducts.add(newProductJson);
      debugPrint("this is the saveProducts:$saveProducts");

      prefs.setStringList('SaveProducts', saveProducts); // Fix the key here
      Utils.toastMessage("Product has been added to Save");
      notifyListeners();
    } catch (e) {
      debugPrint("Error saving product to cache: $e");
    }
  }

  Future<void> getCachedProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String> saveProducts = prefs.getStringList('SaveProducts') ?? [];
      debugPrint("this is the saveProducts:$saveProducts"); // Fix the typo here

      saveList = saveProducts.map((productJson) {
        return json.decode(productJson) as Map<String, dynamic>;
      }).toList();
      debugPrint("this is the saveList:$saveList");
      notifyListeners();
    } catch (e) {
      debugPrint("Error getting cached products: $e");
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      saveList.removeWhere(
          (saveProducts) => saveProducts['productId'] == productId);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> updatedProducts =
          saveList.map((saveProducts) => json.encode(saveProducts)).toList();
      prefs.setStringList('saveProducts', updatedProducts);

      notifyListeners();
    } catch (e) {
      debugPrint("Error deleting product: $e");
    }
  }

  Future<bool> isProductInCart(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> saveProducts =
        prefs.getStringList('SaveProducts') ?? []; // Fix the key here
    debugPrint("this is the saveProducts:$saveProducts");

    for (String productJson in saveProducts) {
      Map<String, dynamic> productMap = json.decode(productJson);
      if (productMap['productId'] == productId) {
        return true;
      }
    }
    return false;
  }
}
