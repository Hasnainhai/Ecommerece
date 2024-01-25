import 'package:ecommerece/res/components/colors.dart';
import 'package:flutter/material.dart';

class LogOutButtons extends StatelessWidget {
  const LogOutButtons(
      {super.key,
      required this.color,
      required this.title,
      required this.onpress});
  final Color color;
  final String title;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 40,
        width: 126,
        color: color,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
