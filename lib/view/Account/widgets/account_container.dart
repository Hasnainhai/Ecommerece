import 'package:ecommerece/res/components/colors.dart';
import 'package:flutter/material.dart';

class AccountContainer extends StatelessWidget {
  final VoidCallback onpress;
  final String title;

  const AccountContainer(
      {super.key, required this.onpress, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 164,
        width: 206,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(
            4,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 70,
                color: AppColor.whiteColor,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'CenturyGothic',
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
      ),
    );
  }
}
