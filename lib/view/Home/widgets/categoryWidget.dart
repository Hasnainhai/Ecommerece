// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../res/components/colors.dart';

class CategoryCart extends StatefulWidget {
  final String label;
  final VoidCallback onpress;

  CategoryCart(this.label, this.onpress);

  @override
  // ignore: library_private_types_in_public_api
  _CategoryCartState createState() => _CategoryCartState();
}

class _CategoryCartState extends State<CategoryCart> {
  Color _backgroundColor = AppColor.fieldBgColor;
  Color _textColor = Colors.black; // Initial text color

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Toggle background color
          _backgroundColor = (_backgroundColor == AppColor.fieldBgColor)
              ? AppColor.secondaryColor
              : AppColor.fieldBgColor;

          // Toggle text color
          _textColor =
              (_textColor == Colors.black) ? Colors.black : Colors.black;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: _backgroundColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.primaryColor)),
            ),
            Center(
              child: Text(
                widget.label,
                style: TextStyle(fontSize: 16, color: _textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
