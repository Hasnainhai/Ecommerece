import 'package:ecommerece/model/user_model.dart';
import 'package:ecommerece/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../utils/routes/routes_name.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthenTication(BuildContext context) {
    getUserData().then((value) {
      if (value.key.isEmpty || value.key == '') {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.onboarding1);
      } else {
        Future.delayed(const Duration(seconds: 5));
        Navigator.pushNamed(context, RoutesName.dashboardScreen);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
