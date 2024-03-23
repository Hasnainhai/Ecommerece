import 'package:ecommerece/repository/shop_product_repository.dart';
import 'package:flutter/material.dart';

class ShopProductRepositoryProvider extends ChangeNotifier {
  ShopProductRepository _shopProductRepository = ShopProductRepository();

  ShopProductRepository get shopProductRepository => _shopProductRepository;

  Future<void> getHomeProd(BuildContext context, String id) async {
    await _shopProductRepository.fetchData(id, context);
    notifyListeners();
  }

  void search(
    String searchTerm,
  ) {
    _shopProductRepository.search(searchTerm);
    notifyListeners();
  }
}
