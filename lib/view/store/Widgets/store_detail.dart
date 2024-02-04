import 'package:ecommerece/res/components/colors.dart';
import 'package:flutter/material.dart';

class StoreDetailCard extends StatelessWidget {
  final String shopName;
  final String rating;
  final String discription;
  const StoreDetailCard(
      {super.key,
      required this.shopName,
      required this.rating,
      required this.discription});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage("images/store.png"),
        ),
        const SizedBox(
          width: 12,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Best day cloth house",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    "5.0",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Elit libero et ultricies volutpat sapien ",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 24,
          width: 57,
          decoration: const BoxDecoration(
            color: Color(0xff179673),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: const Center(
            child: Text(
              "Contact us",
              style: TextStyle(
                fontFamily: 'CenturyGothic',
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: AppColor.whiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
