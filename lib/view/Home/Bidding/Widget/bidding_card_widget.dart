import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

class BiddingCard extends StatelessWidget {
  const BiddingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 96,
          width: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              4,
            ),
            color: AppColor.fieldBgColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/coat.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cauliflower Bangladeshi",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColor.fontColor,
                            ),
                          ),
                          Text(
                            "Pending",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Duis aute veniam veniam qui aliquip irure",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: AppColor.fontColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$20",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                4,
                              ),
                              color: AppColor.primaryColor,
                            ),
                            child: const Center(
                              child: Text(
                                "View",
                                style: TextStyle(
                                  fontFamily: 'CenturyGothic',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const VerticalSpeacing(
          16,
        ),
      ],
    );
  }
}
