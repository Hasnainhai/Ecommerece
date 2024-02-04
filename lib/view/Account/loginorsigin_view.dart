// ignore_for_file: file_names
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/login_buttons.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';

import '../../res/components/rounded_button.dart';
import '../../res/components/verticalSpacing.dart';

import 'package:flutter/material.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: <Widget>[
              const VerticalSpeacing(40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const DashBoardScreen()),
                          (route) => false);
                    },
                    child: const Text(
                      'Skip Login',
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(40.0),

              // Container(
              //   height: 80.0,
              //   width: 215.0,
              //   color: AppColor.logoBgColor,
              //   child: Padding(
              //     padding: const EdgeInsets.all(15.0),
              //     child: Center(
              //       child: Image.asset('images/logo.png'),
              //     ),
              //   ),
              // ),
              const Text(
                'Logo',
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(50.0),
              const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Welcome to our \n',
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: AppColor.fontColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'e commerce app',
                        style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 30.0),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpeacing(50.0),
              RoundedButton(
                  color: AppColor.primaryColor,
                  title: 'Login With Email',
                  onpress: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.login,
                    );
                  }),
              const VerticalSpeacing(50.0),
              const Text(
                'OR',
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoginButtons(
                    color: AppColor.fontColor,
                    img: "images/apple.png",
                    onpress: () {},
                  ),
                  LoginButtons(
                    color: AppColor.googleColor,
                    img: "images/google.png",
                    onpress: () {},
                  ),
                  LoginButtons(
                    color: AppColor.twitterColor,
                    img: "images/twitter.png",
                    onpress: () {},
                  ),
                  LoginButtons(
                    color: AppColor.twitterColor,
                    img: "images/facebook.png",
                    onpress: () {},
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
