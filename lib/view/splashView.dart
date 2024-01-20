import 'package:ecommerece/res/components/colors.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // SplashServices splashServices = SplashServices();

  // @override
  // void initState() {
  //   splashServices.checkAuthenTication(context);
  //   super.initState();
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
