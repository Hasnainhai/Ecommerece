import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

class ReviewCompleteDialog extends StatelessWidget {
  const ReviewCompleteDialog({super.key});

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
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const VerticalSpeacing(
                      16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.primaryColor,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.close,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        height: 144,
                        width: 144,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColor.primaryColor,
                            width: 8,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.primaryColor, width: 2.5),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                        // child: Container(
                        //   height: 20,
                        //   width: 20,
                        //   decoration: BoxDecoration(
                        //       // borderRadius: BorderRadius.all(
                        //       //   Radius.circular(10),
                        //       // ),
                        //       border: Border.all(
                        //     color: AppColor.primaryColor,
                        //   )),
                        // ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Thanks",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1D4877),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "your review has been\nsubmitted successfully.",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1D4877),
                        ),
                      ),
                    ),
                    const VerticalSpeacing(
                      40,
                    ),
                    RoundedButton(
                      title: "Done",
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
