import 'package:ecommerece/data/response/api_response.dart';
import 'package:ecommerece/repository/home_repository.dart';
import 'package:flutter/foundation.dart';

import '../model/home_prod_model.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<HomeProdModel> allProd = ApiResponse.loading();

  setAllProd(ApiResponse<HomeProdModel> response) {
    allProd = response;
    notifyListeners();
  }

  Future<void> fetchAllProdApi() async {
    setAllProd(ApiResponse.loading());
    await _myRepo.fetchAllProd().then((value) {
      setAllProd(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setAllProd(ApiResponse.error(error.toString()));
    });
  }
}
