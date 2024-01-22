import 'package:flutter/material.dart';

class LoginViewButtons extends StatelessWidget {
  const LoginViewButtons({
    super.key,
    required this.color,
    required this.img,
    required this.onpress,
  });
  final Color color;
  final String img;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress(),
      child: Container(
        height: 56,
        width: 174,
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
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: color,
                image: DecorationImage(
                  image: AssetImage(img),
                ),
              ),
            ),
            Text(
              "or",
              style: TextStyle(
                fontFamily: 'CenturyGothic',
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
