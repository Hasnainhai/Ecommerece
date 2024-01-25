import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/view/Home/save/Widgets/save_card.dart';
import 'package:ecommerece/view/Orders/widgets/myOrdercard.dart';
import 'package:flutter/material.dart';

import '../../res/components/colors.dart';

class MyOrderHistory extends StatelessWidget {
  const MyOrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.blackColor,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'My Order History',
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColor.blackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpeacing(40.0),
            myOrderCard(ontap: () {}),
            const VerticalSpeacing(18.0),
            const Text(
              'Product Detail',
              style: TextStyle(
                fontFamily: 'CenturyGothic',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColor.blackColor,
              ),
            ),
            const VerticalSpeacing(18.0),
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              color: AppColor.fieldBgColor,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 43,
                          width: 60,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/coat.png"),
                            ),
                          ),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cot winter",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColor.fontColor,
                              ),
                            ),
                            Text(
                              "Duis aute veniam veniam qui \naliquip irure  ",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: AppColor.fontColor,
                              ),
                            ),
                          ],
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: AppColor.fontColor,
                                  ),
                                ),
                              ],
                            ),
                            VerticalSpeacing(10.0),
                            Text(
                              "\$10",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: AppColor.fontColor,
                              ),
                            ),
                            // VerticalSpeacing(20),
                            // Icon(Icons.shopping_bag_outlined),
                          ],
                        )
                      ],
                    ),
                    const VerticalSpeacing(10.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 23.0),
                        Text(
                          'sort by:',
                          style: TextStyle(
                              color: AppColor.blackColor, fontSize: 14),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          'best day cloth house',
                          style: TextStyle(
                              color: AppColor.blackColor, fontSize: 14),
                        ),
                      ],
                    ),
                    // const VerticalSpeacing(10.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 23.0),
                        Text(
                          'Quantity:',
                          style: TextStyle(
                              color: AppColor.blackColor, fontSize: 14),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          '2',
                          style: TextStyle(
                              color: AppColor.blackColor, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpeacing(43),
            RoundedButton(
                title: 'Done',
                onpress: () {
                  Navigator.pop(context);
                },
                color: AppColor.primaryColor)
          ],
        ),
      ),
    );
  }
}
