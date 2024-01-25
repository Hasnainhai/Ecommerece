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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'order ID : 0099#',
                  style: TextStyle(
                    color: AppColor.secondaryFontColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  '25 NOV',
                  style: TextStyle(
                    color: AppColor.secondaryFontColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
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
                    color: AppColor.secondaryFontColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                _buildStatusIndicator('Confirmed', AppColor.primaryColor),
                _buildStatusIndicator('Pending', Colors.green),
                _buildStatusIndicator('Cancell', Colors.red),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 80,
                    color: AppColor.primaryColor,
                    child: const Center(
                      child: Text(
                        'View',
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
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String status, Color color) {
    return Column(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            shape: BoxShape.rectangle,
          ),
          // child: Icon(Icons.check, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          status,
          style: const TextStyle(color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
