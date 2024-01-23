import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

class SaveCard extends StatelessWidget {
  const SaveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 82,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/coat.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
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
                        "Duis aute veniam veniam qui aliquip irure  ",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: AppColor.fontColor,
                        ),
                      ),
                      Text(
                        "\$10",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: AppColor.fontColor,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_outline),
                      VerticalSpeacing(20),
                      Icon(Icons.shopping_bag_outlined),
                    ],
                  )
                ],
              ),
            ],
          ),
          const VerticalSpeacing(12),
          const Divider(
            color: Color(0xffECECEC),
          )
        ],
      ),
    );
  }
}
