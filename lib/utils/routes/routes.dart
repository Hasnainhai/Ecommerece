import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/dashboard/cartScreen.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/dashboard/favouriteScreen.dart';
import 'package:ecommerece/view/Home/dashboard/pre_love_screen.dart';
import 'package:ecommerece/view/Home/dashboard/profileScreen.dart';
import 'package:ecommerece/view/Home/dashboard/shop.dart';

import 'package:ecommerece/view/Account/loginorsigin_view.dart';
import 'package:ecommerece/view/Onboardings/onboarding1.dart';
import 'package:ecommerece/view/Onboardings/onboarding3.dart';
import 'package:ecommerece/view/Onboardings/onbording2.dart';
import 'package:flutter/material.dart';

import '../../view/Home/Home_Screen.dart';
import '../../view/Login_view.dart';
import '../../view/SignUpView.dart';
import '../../view/Home_Screen.dart';
import '../../view/Account/Login_view.dart';
import '../../view/Account/SignUpView.dart';
import '../../view/splashView.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
      case RoutesName.onboarding1:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnBordingScreen1());
      case RoutesName.onboarding2:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnBordingScreen2());
      case RoutesName.onboarding3:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnBordingScreen3());
      case RoutesName.dashboardScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashBoardScreen());
      case RoutesName.shopScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ShopScreen());
      case RoutesName.preLove:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PreLoveScreen());
      case RoutesName.cartScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CartScreen());
      case RoutesName.favouriteScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FavouriteScreen());
      case RoutesName.profile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProfileScreen());

      case RoutesName.loginorsigin:
        return MaterialPageRoute(builder: (c) => const LoginOrSignUp());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No routes define'),
            ),
          );
        });
    }
  }
}
