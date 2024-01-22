import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons(
      {super.key,
      required this.color,
      required this.img,
      required this.onpress});
  final Color color;
  final String img;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress(),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 1,
          ),
          // image: DecorationImage(
          //   image: AssetImage(img),
          //   fit: BoxFit.contain,
          // ),
        ),
        child: Center(
          child: Image.asset(
            img,
            height: 30,
            width: 25,
          ),
        ),
      ),
    );
  }
}
