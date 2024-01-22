// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:ecommerece/res/components/custom_text_field.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../../res/components/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? image;

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
    nameController.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 29, top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpeacing(60),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Logo',
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: AppColor.fontColor,
                          ),
                        ),
                        VerticalSpeacing(30),
                        Text(
                          "Welcome to our",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: AppColor.fontColor,
                          ),
                        ),
                        Text(
                          "e commerce app",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Register",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 24,
                            color: AppColor.fontColor,
                          ),
                        ),
                        // Center(
                        //   child: Stack(
                        //     alignment: AlignmentDirectional.bottomCenter,
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.only(bottom: 10),
                        //         child: CircleAvatar(
                        //           radius: 50,
                        //           backgroundColor: AppColor.primaryColor,
                        //           foregroundImage: image == null
                        //               ? null
                        //               : FileImage(
                        //                   image!,
                        //                 ),
                        //         ),
                        //       ),
                        //       GestureDetector(
                        //         child: Container(
                        //             height: 28,
                        //             width: 28,
                        //             color: Colors.white,
                        //             child: const Icon(Icons.add)),
                        //         onTap: () {},
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        const VerticalSpeacing(30),
                        // Name
                        TextFieldCustom(
                          controller: nameController,
                          maxLines: 1,
                          text: "Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const VerticalSpeacing(30),
                        //Email
                        TextFieldCustom(
                          controller: emailController,
                          maxLines: 1,
                          text: "Email",
                          validator: (value) {
                            if (value!.isEmpty || !value.contains("@")) {
                              return "Please enter a valid Email adress";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const VerticalSpeacing(30),
                        // Password
                        TextFieldCustom(
                          controller: passwordController,
                          maxLines: 1,
                          text: "Password",
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return "Please enter a valid password";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const VerticalSpeacing(30),
                        _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : RoundedButton(
                                                color: AppColor.primaryColor,

                              
                              title: "Register", onpress: () {}),
                        const VerticalSpeacing(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have account",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.fontColor,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, RoutesName.login);
                              },
                              child: const Text(
                                "Log In",
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
                        const VerticalSpeacing(30),
                      ],
                    ),
                  ),
                ),
                const VerticalSpeacing(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
