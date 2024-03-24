import 'dart:convert';
import 'package:ecommerece/res/components/custom_text_field.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/utils.dart';
import 'package:flutter/material.dart';
import '../../res/components/colors.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});
  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  // bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  Future<void> _sendResetPasswordRequest() async {
    final email = _emailController.text;
    final url = Uri.parse(
        'http://zarozar.exarth.com/accounts/api/auth/password/reset/');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      // Handle success
      setState(() {
        Utils.toastMessage(' password reset email has been sent.');
      });
    } else {
      // Handle error
      setState(() {
        Utils.toastMessage('An error occurred. Please try again later.');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "Forget Password",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.fontColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.fontColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpeacing(24),
                  const Text(
                    "Reset Your Password",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: AppColor.fontColor,
                    ),
                  ),
                  const VerticalSpeacing(24),
                  const Text(
                    "Please enter your email. We will send a link to your email to reset your password.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8B8B97),
                    ),
                  ),
                  const VerticalSpeacing(30),
                  TextFieldCustom(
                    controller: _emailController,
                    maxLines: 1,
                    text: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const VerticalSpeacing(80),
                  RoundedButton(
                    color: AppColor.primaryColor,
                    title: "Send Me Link",
                    onpress: _sendResetPasswordRequest,
                  ),
                  const VerticalSpeacing(200),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
