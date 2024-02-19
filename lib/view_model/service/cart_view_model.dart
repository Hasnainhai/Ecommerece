import 'package:ecommerece/repository/cart_repository.dart';
import 'package:flutter/material.dart';

class CartRepositoryProvider extends ChangeNotifier {
  CartRepository _cartRepositoryProvider = CartRepository();

  CartRepository get cartRepositoryProvider => _cartRepositoryProvider;

  Future<void> getCachedProducts() async {
    await _cartRepositoryProvider.getCachedProducts();
    notifyListeners();
  }
}
