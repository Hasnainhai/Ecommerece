import 'package:ecommerece/repository/all_repository.dart';
import 'package:flutter/material.dart';

class AllProductsRepositoryProvider extends ChangeNotifier {
  AllProductsRepository _allProductsRepository = AllProductsRepository();

  AllProductsRepository get allProductsRepository => _allProductsRepository;

  Future<void> getHomeProd(BuildContext context) async {
    await _allProductsRepository.fetchData(context);
    notifyListeners();
  }
}
