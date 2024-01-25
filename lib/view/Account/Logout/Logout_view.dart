import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/custom_text_field.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/view/Account/Logout/widgets/logout_buttons_widgets.dart';
import 'package:flutter/material.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({super.key});

  @override
  State<LogoutView> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const VerticalSpeacing(34),
                const Icon(
                  Icons.logout_outlined,
                  size: 40,
                  color: AppColor.fontColor,
                ),
                const VerticalSpeacing(14),
                const Text(
                  "Are your sure logout this acoout",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.fontColor,
                  ),
                ),
                const VerticalSpeacing(18),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20),
                  child: Text(
                    "Sorry you n’t haven’t placed any order yet. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff8B8B97),
                    ),
                  ),
                ),
                const VerticalSpeacing(34),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogOutButtons(
                      color: AppColor.blackColor,
                      title: "No",
                      onpress: () {},
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    LogOutButtons(
                      color: AppColor.primaryColor,
                      title: "Yes",
                      onpress: () {},
                    ),
                  ],
                ),
                const VerticalSpeacing(70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
