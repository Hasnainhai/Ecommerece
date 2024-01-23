// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../res/components/colors.dart';

class CategoryCart extends StatefulWidget {
  final String label;

  CategoryCart(this.label);

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
              (_textColor == Colors.black) ? Colors.white : Colors.black;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: _backgroundColor,
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(fontSize: 16, color: _textColor),
            ),
          ),
        ),
      ),
    );
  }
}
