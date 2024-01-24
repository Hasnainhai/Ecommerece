import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/custom_text_field.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/biding_title.dart';
import 'package:flutter/material.dart';

class BidDialog extends StatefulWidget {
  const BidDialog({super.key});

  @override
  State<BidDialog> createState() => _BidDialogState();
}

class _BidDialogState extends State<BidDialog> {
  TextEditingController amountController = TextEditingController();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const VerticalSpeacing(30),
                  const Center(
                    child: Text(
                      "Bidding",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.fontColor,
                      ),
                    ),
                  ),
                  const VerticalSpeacing(34),
                  const Text(
                    "Product detail",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.fontColor,
                    ),
                  ),
                  const VerticalSpeacing(
                    10,
                  ),
                  const BidingTile(),
                  const VerticalSpeacing(
                    24,
                  ),
                  const Text(
                    "Delivery address",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.fontColor,
                    ),
                  ),
                  const VerticalSpeacing(
                    24,
                  ),
                  TextFieldCustom(
                    controller: amountController,
                    maxLines: 1,
                    text: "Amount",
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
                    controller: amountController,
                    maxLines: 1,
                    text: "Amount",
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
                      title: "Place Order",
                      onpress: () {},
                      color: AppColor.primaryColor),
                  const VerticalSpeacing(
                    46,
                  ),
                ],
              ),
            )));
  }
}
