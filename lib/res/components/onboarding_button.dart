import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'colors.dart';

class OnButton extends StatelessWidget {
  final double progress;
  final Function()? onTap;
  const OnButton({super.key, required this.progress, this.onTap});
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 45,
      percent: progress,
      progressColor: AppColor.primaryColor,
      backgroundColor: const Color(0xffF7F7F7),
      center: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primaryColor,
          ),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
