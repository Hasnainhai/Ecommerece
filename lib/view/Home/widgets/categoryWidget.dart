// ignore_for_file: file_names

import 'package:ecommerece/repository/home_ui_repository.dart';
import 'package:ecommerece/res/enums.dart';
import 'package:ecommerece/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../res/components/colors.dart';

class CategoryCart extends StatefulWidget {
  final String label;

  CategoryCart(
    this.label,
  );

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
        Provider.of<HomeRepositoryProvider>(context, listen: false)
            .categoryFilter(
          widget.label,
        );
        Provider.of<HomeUiSwithchRepository>(context, listen: false)
            .switchToType(
          UIType.CategoriesSection,
        );
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
