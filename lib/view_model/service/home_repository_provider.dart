import 'package:ecommerece/view/Home/repository/home_repository.dart';
import 'package:flutter/material.dart';

class HomeRepositoryProvider extends ChangeNotifier {
  HomeRepository _homeRepository = HomeRepository();

  HomeRepository get homeRepository => _homeRepository;

  Future<void> getHomeProd() async {
    await _homeRepository.getHomeProd();
    notifyListeners();
  }

  String calculateDiscountedPrice(double originalPrice, double discount) {
    double discountedPrice = originalPrice - (originalPrice * (discount / 100));
    int truncatedDiscountedPrice = discountedPrice.truncate();
    return truncatedDiscountedPrice.toString();
  }
}
