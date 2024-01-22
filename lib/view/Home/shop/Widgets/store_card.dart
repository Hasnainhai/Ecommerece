import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      width: 168,
      color: const Color(0xffF9F9F9),
      child: Column(children: [
        const VerticalSpeacing(8),
        Container(
          height: 102,
          width: 144,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/store.png"),
            ),
          ),
        ),
        const VerticalSpeacing(7),
        const Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "best day cloth",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColor.fontColor,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 12,
                  ),
                  Text(
                    "4.5",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: AppColor.fontColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const VerticalSpeacing(4),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New hussaiabad",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: AppColor.fontColor,
                ),
              ),
              Container(
                height: 18,
                width: 44,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Center(
                  child: Text(
                    "Visit",
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
        ),
      ]),
    );
  }
}
