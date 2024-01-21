import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Onboardings/onboarding1.dart';
import 'package:ecommerece/view/Onboardings/onboarding3.dart';
import 'package:ecommerece/view/Onboardings/onbording2.dart';
import 'package:flutter/material.dart';

import '../../view/Home_Screen.dart';
import '../../view/Login_view.dart';
import '../../view/SignUpView.dart';
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
