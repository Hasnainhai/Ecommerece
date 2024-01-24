import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/view/Home/CheckOut/Widgets/check_box.dart';
import 'package:flutter/material.dart';

class AddressSelectWidget extends StatefulWidget {
  const AddressSelectWidget({super.key});

  @override
  State<AddressSelectWidget> createState() => _AddressSelectWidgetState();
}

class _AddressSelectWidgetState extends State<AddressSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          border: Border.all(width: 2, color: AppColor.primaryColor)),
      child: const Padding(
        padding: EdgeInsets.only(top: 15.0, left: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCheckBox(),
            SizedBox(width: 15.0),
            Text.rich(
              TextSpan(
                text: "Home Address",
                // text: widget.title.length > 20
                //     ? '${widget.title.substring(0, 20)}...\n'
                //     : widget.title,
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whiteColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n1749 Custom Road, Chhatak',
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                  TextSpan(
                    text: "\n(309) 071-9396-939",
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
