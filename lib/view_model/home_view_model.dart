import 'package:ecommerece/data/response/api_response.dart';
import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/repository/home_repository.dart';
import 'package:flutter/foundation.dart';

// class HomeViewModel with ChangeNotifier {
//   final _myRepo = HomeRepository();
//   ApiResponse<HomeProdModel> allProd = ApiResponse.loading();

//   setAllProd(ApiResponse<HomeProdModel> response) {
//     allProd = response;
//     notifyListeners();
//   }

//   Future<void> fetchAllProdApi() async {
//     setAllProd(ApiResponse.loading());
//     _myRepo.fetchAllProd().then((value) {
//       setAllProd(ApiResponse.completed(value));
//     }).onError((error, stackTrace) {
//       setAllProd(ApiResponse.error(error.toString()));
//     });
//   }
// }

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
}
