import 'package:ecommerece/repository/preloved_repository.dart';
import 'package:flutter/material.dart';

class HomeRepositoryProvider extends ChangeNotifier {
  PrelovedRepository _prelovedRepository = PrelovedRepository();

  PrelovedRepository get prelovedRepository => _prelovedRepository;

  Future<void> getHomeProd(BuildContext context) async {
    await _prelovedRepository.fetchPrelovedProducts(context);
    notifyListeners();
  }
}
