// import 'package:ecommerece/data/network/BaseApiServices.dart';
// import 'package:ecommerece/data/network/NetworkApiServiecs.dart';
// import 'package:ecommerece/model/all_prod_model.dart';
// import 'package:ecommerece/res/app_url.dart';

// class HomeRepository {
//   final BaseApiServices _apiServices = NetworkApiService();
//   Future<AllProdModel> fetchAllProd() async {
//     try {
//       dynamic response =
//           await _apiServices.getGetApiResponse(AppUrl.allProdEndPoint);
//       return response = AllProdModel.fromJson(response);
//     } catch (e) {
//       throw e;
//     }
//   }
// }
import 'package:ecommerece/data/network/BaseApiServices.dart';
import 'package:ecommerece/data/network/NetworkApiServiecs.dart';
import 'package:ecommerece/res/app_url.dart';

import '../model/home_prod_model.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  Future<HomeProdModel> fetchAllProd() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.allProdEndPoint);
      return response = HomeProdModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
