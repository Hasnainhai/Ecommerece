import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/view/Account/widgets/account_container.dart';
import 'package:flutter/material.dart';

class SelectAccountType extends StatelessWidget {
  const SelectAccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "New Account ",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 16,
            fontWeight: FontWeight.w600,
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
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpeacing(46),
              const Text(
                'Choose Your Account Ragister',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'CenturyGothic',
                  color: AppColor.fontColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalSpeacing(10),
              const Text(
                'In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'CenturyGothic',
                  color: AppColor.fontColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalSpeacing(46),
              AccountContainer(
                onpress: () {},
                title: 'Sign Up As\n A buyer',
              ),
              const VerticalSpeacing(34),
              AccountContainer(
                onpress: () {},
                title: "Sign Up As\n A Vender",
              ),
            ],
          ),
        ),
      )),
    );
  }
}
