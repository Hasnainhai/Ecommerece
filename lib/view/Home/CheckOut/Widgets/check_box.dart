// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:ecommerece/res/components/colors.dart';
import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({
    super.key,
  });
  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isChecked = false;

  void onChanged() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          border: Border.all(
            color: isChecked ? AppColor.primaryColor : AppColor.whiteColor,
          ),
        ),
        child: isChecked
            ? Center(
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  color:
                      isChecked ? AppColor.whiteColor : AppColor.primaryColor,
                ),
              )
            : null,
      ),
    );
  }
}
