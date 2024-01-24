import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

class MyAddressWidget extends StatelessWidget {
  const MyAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 125,
          width: 374,
          decoration: BoxDecoration(
            color: AppColor.fieldBgColor,
            borderRadius: BorderRadius.circular(
              4,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rayees",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.fontColor,
                      ),
                    ),
                    Text(
                      "Post code:5200",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.fontColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColor.fontColor,
                          size: 14,
                        ),
                        Text(
                          "Address:new husainabad",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: AppColor.fontColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 28,
                      width: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColor.primaryColor),
                      child: const Center(
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: AppColor.fontColor,
                      size: 14,
                    ),
                    Text(
                      "phone:03554403587",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColor.fontColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.circle_outlined,
                          color: AppColor.fontColor,
                          size: 14,
                        ),
                        Text(
                          "country:PK",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: AppColor.fontColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 28,
                      width: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xffFF5C00)),
                      child: const Center(
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
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
        ),
        const VerticalSpeacing(
          16,
        ),
      ],
    );
  }
}
