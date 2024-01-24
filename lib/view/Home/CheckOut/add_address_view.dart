import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/custom_text_field.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.only(left: 12, right: 12),
        child: Container(
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const VerticalSpeacing(30),
                    const Center(
                      child: Text(
                        "Add  new address",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.fontColor,
                        ),
                      ),
                    ),
                    const VerticalSpeacing(
                      36,
                    ),
                    TextFieldCustom(
                      // controller: amountController,
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
                    const VerticalSpeacing(
                      8,
                    ),
                    TextFieldCustom(
                      // controller: amountController,
                      maxLines: 1,
                      text: "Address",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const VerticalSpeacing(
                      8,
                    ),
                    TextFieldCustom(
                      // controller: amountController,
                      maxLines: 1,
                      text: "Address line",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const VerticalSpeacing(
                      8,
                    ),
                    TextFieldCustom(
                      // controller: amountController,
                      maxLines: 1,
                      text: "City",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const VerticalSpeacing(
                      8,
                    ),
                    TextFieldCustom(
                      // controller: amountController,
                      maxLines: 1,
                      text: "State",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const VerticalSpeacing(
                      40,
                    ),
                    RoundedButton(
                      title: "Add address",
                      onpress: () {
                        Navigator.pop(context);
                      },
                      color: AppColor.primaryColor,
                    ),
                    const VerticalSpeacing(
                      46,
                    ),
                  ],
                ),
              ),
            )));
  }
}
