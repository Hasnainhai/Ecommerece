import 'package:ecommerece/model/home_prod_model.dart';
import 'package:flutter/material.dart';

class NewItemsRepository extends ChangeNotifier {
  List<Products> searchProducts = [];

  void searchItems(List<Products> product, String query) {
    searchProducts = product
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
