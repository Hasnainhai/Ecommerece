import 'package:ecommerece/data/response/api_response.dart';
import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/repository/home_repository.dart';

import 'package:flutter/material.dart';

class HomeRepositoryProvider extends ChangeNotifier {
  HomeRepository _homeRepository = HomeRepository();

  HomeRepository get homeRepository => _homeRepository;

  Future<void> getHomeProd(BuildContext context) async {
    await _homeRepository.getHomeProd(context);
    notifyListeners();
  }

  String calculateDiscountedPrice(double originalPrice, double discount) {
    String discountedPrice =
        _homeRepository.calculateDiscountedPrice(originalPrice, discount);
    notifyListeners();
    return discountedPrice;
  }

  void search(
    String searchTerm,
    List<Products> productsTopOrder,
    List<Products> productsNew,
  ) {
    _homeRepository.search(searchTerm, productsTopOrder, productsNew);
    notifyListeners();
  }

  void categoryFilter(
    String categrio,
  ) {
    _homeRepository.categoryFilter(categrio);
    notifyListeners();
  }

  void filterProducts(
    String categrio,
    int maxRating,
    double minPrice,
    double maxPrice,
  ) {
    _homeRepository.filterProducts(
      categrio,
      maxRating,
      minPrice,
      maxPrice,
    );
    notifyListeners();
  }
}
