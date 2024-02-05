import 'package:ecommerece/model/preloved_model.dart';
import 'package:ecommerece/repository/preloved_repository.dart';
import 'package:flutter/material.dart';

class PrelovedRepositoryProvider extends ChangeNotifier {
  PrelovedRepository _prelovedRepository = PrelovedRepository();

  PrelovedRepository get prelovedRepository => _prelovedRepository;

  Future<void> getHomeProd(BuildContext context) async {
    await _prelovedRepository.fetchPrelovedProducts(context);
    notifyListeners();
  }

  Future<void> searchAndFetchData(
      String query, List<PrelovedProduct> product) async {
    _prelovedRepository.searchItems(product, query);
  }
}
