import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

class FastShippingContainer extends StatelessWidget {
  const FastShippingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81,
      width: 372,
      decoration: BoxDecoration(
        color: AppColor.fieldBgColor,
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 52,
                width: 57,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  image: const DecorationImage(
                    image: AssetImage("images/fast.png"),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fast delivery',
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor,
                    ),
                  ),
                  Text(
                    '2 40 day take to reach',
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Icon(
            Icons.navigate_next,
            size: 28,
            color: Color(0xff222222),
          )
        ],
      ),
    );
  }
}
