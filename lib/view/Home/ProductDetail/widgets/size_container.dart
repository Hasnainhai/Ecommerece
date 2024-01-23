import 'package:ecommerece/res/components/colors.dart';
import 'package:flutter/material.dart';

class SizeContainer extends StatelessWidget {
  const SizeContainer({
    super.key,
    required this.color,
    required this.title,
    required this.fontColor,
  });
  final Color color;
  final String title;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 58,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColor.primaryColor)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
