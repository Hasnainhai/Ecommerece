import 'package:ecommerece/repository/cart_repository.dart';
import 'package:flutter/material.dart';

class CartRepositoryProvider extends ChangeNotifier {
  CartRepository _cartRepositoryProvider = CartRepository();

  CartRepository get cartRepositoryProvider => _cartRepositoryProvider;

  Future<void> getCachedProducts() async {
    await _cartRepositoryProvider.getCachedProducts();
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    await _cartRepositoryProvider.deleteProduct(
      id,
    );
    notifyListeners();
  }

  void addQuantity(int amount) {
    _cartRepositoryProvider.addQuantity(amount);
    notifyListeners();
  }

  void removeQuantity(int amount) {
    _cartRepositoryProvider.removeQuantity(amount);
    notifyListeners();
  }
}
