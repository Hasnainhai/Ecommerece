import 'package:ecommerece/res/components/colors.dart';
import 'package:flutter/material.dart';

import '../utils/routes/routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void startTimer() async {
    await Future.delayed(const Duration(seconds: 5), () async {
      await Navigator.pushNamed(context, RoutesName.onboarding1);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  // SplashServices splashServices = SplashServices();

  // @override
  // void initState() {
  //   splashServices.checkAuthenTication(context);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'LOGO',
          style: TextStyle(
              fontSize: 24.0,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
