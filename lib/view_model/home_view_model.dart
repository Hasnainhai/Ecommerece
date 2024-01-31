// import 'package:ecommerece/data/response/api_response.dart';
// import 'package:ecommerece/model/all_prod_model.dart';
// import 'package:ecommerece/repository/home_repository.dart';
// import 'package:flutter/foundation.dart';

// class HomeViewModel with ChangeNotifier {
//   final _myRepo = HomeRepository();
//   ApiResponse<AllProdModel> allProd = ApiResponse.loading();

//   setAllProd(ApiResponse<AllProdModel> response) {
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
