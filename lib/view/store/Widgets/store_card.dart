import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
    required this.ontap,
    required this.name,
    required this.rating,
    required this.address,
    required this.img,
  });
  final Function ontap;
  final String name;
  final String rating;
  final String address;
  final String img;

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
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name.length > 18 ? '${name.substring(0, 18)}...' : name,
                style: const TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColor.fontColor,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 12,
                  ),
                  Text(
                    rating,
                    style: const TextStyle(
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
              Text(
                address.length > 15
                    ? '${address.substring(0, 15)}...'
                    : address,
                style: const TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: AppColor.fontColor,
                ),
              ),
              InkWell(
                onTap: () {
                  ontap();
                },
                child: Container(
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
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
