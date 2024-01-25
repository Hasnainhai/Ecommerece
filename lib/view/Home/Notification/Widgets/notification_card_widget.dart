import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpeacing(20),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              color: AppColor.primaryColor,
              child: const Center(
                child: Icon(
                  Icons.notifications,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "your order complte send review",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColor.fontColor,
                    ),
                  ),
                  Text(
                    "Hot Deal Buy one get free one Offer Hery...",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff8B8B97),
                    ),
                  ),
                  Text(
                    "10 Minute Ago",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff8B8B97),
                    ),
                  ),
                  VerticalSpeacing(10),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffECECEC),
        ),
      ],
    );
  }
}
