import 'package:flutter/material.dart';

class LoginViewButtons extends StatelessWidget {
  const LoginViewButtons({
    super.key,
    required this.color,
    required this.img,
    required this.onpress,
    required this.text,
  });
  final Color color;
  final String img;
  final VoidCallback onpress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 56,
        width: (MediaQuery.of(context).size.width / 2.2) - 10,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: color,
                ),
                child: Center(
                  child: Image.asset(
                    img,
                    height: 14,
                    width: 12,
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                text,
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
      ),
    );
  }
}
