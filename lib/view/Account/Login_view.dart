import 'package:ecommerece/res/components/custom_text_field.dart';
import 'package:ecommerece/res/components/login_view_buttons.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/components/colors.dart';
import '../../view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const VerticalSpeacing(40.0),
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
                        fontSize: 24,
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
                              fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalSpeacing(80.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // TextFieldCustom(
                      //   controller: nameController,
                      //   maxLines: 1,
                      //   text: 'username',
                      //   keyboardType: TextInputType.emailAddress,
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "Please enter a valid Email adress";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
                      TextFieldCustom(
                        controller: emailController,
                        maxLines: 1,
                        text: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return "Please enter a valid Email adress";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFieldCustom(
                        controller: passwordController,
                        maxLines: 1,
                        text: 'Your Password',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return "Please enter a valid password";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   // RoutesName.restscreen,
                    // );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.forgetpassword,
                          );
                        },
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.fontColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpeacing(30),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : RoundedButton(
                        color: AppColor.primaryColor,
                        title: "Login",
                        onpress: () {
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (c) => const DashBoardScreen()),
                          //     (route) => false);
                          if (emailController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'please enter your email', context);
                          } else if (passwordController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'please enter your password', context);
                          } else if (passwordController.text.length < 6) {
                            Utils.flushBarErrorMessage(
                                'plase enter more than six digits', context);
                          } else {
                            Map data = {
                              'username': nameController.text.toString(),
                              'email': emailController.text.toString(),
                              'password': passwordController.text.toString(),
                            };
                            if (data.isNotEmpty) {
                              authViewModel.loginApi(data, context);
                              print('Successfully Login');
                            }
                          }
                        }),
                const VerticalSpeacing(20.0),
                const Text(
                  "or",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColor.fontColor,
                  ),
                ),
                const VerticalSpeacing(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoginViewButtons(
                      color: AppColor.googleColor,
                      img: "images/google2.png",
                      onpress: () {},
                      text: "Google",
                    ),
                    LoginViewButtons(
                      color: AppColor.fontColor,
                      img: "images/apple2.png",
                      onpress: () {},
                      text: "Apple",
                    )
                  ],
                ),
                const VerticalSpeacing(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t Have Account?",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColor.fontColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.signUp,
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpeacing(90.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
