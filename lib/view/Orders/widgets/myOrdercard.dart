// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../res/components/colors.dart';
import '../../../res/components/verticalSpacing.dart';

// ignore: camel_case_types
class myOrderCard extends StatefulWidget {
  const myOrderCard({
    super.key,
  });

  @override
  State<myOrderCard> createState() => _myOrderCardState();
}

class _myOrderCardState extends State<myOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114.0,
      width: double.infinity,
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '25 NOV',
                  style: TextStyle(
                    color: AppColor.fieldBgColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // debugPrint("this is the img:${widget.img}");
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (c) => OrderTrackingScreen(
                    //       img: widget.img,
                    //     ),
                    //   ),
                    // );
                  },
                  child: Container(
                    height: 30,
                    width: 80,
                    color: AppColor.primaryColor,
                    child: const Center(
                      child: Text(
                        ' Order Id',
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpeacing(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Status:',
                  style: TextStyle(
                    color: AppColor.fieldBgColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Pending',
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
