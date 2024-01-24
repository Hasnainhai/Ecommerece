import 'package:ecommerece/res/components/colors.dart';
import 'package:flutter/material.dart';

class BidingTile extends StatelessWidget {
  const BidingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColor.fieldBgColor,
      contentPadding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      leading: Container(
        height: 43,
        width: 60,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/coat.png"),
        )),
      ),
      title: const Text(
        "Cauliflower Bangladeshi",
        style: TextStyle(
          fontFamily: 'CenturyGothic',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColor.fontColor,
        ),
      ),
      subtitle: const Text(
        "Duis aute veniam veniam qui aliquip irure  ",
        style: TextStyle(
          fontFamily: 'CenturyGothic',
          fontSize: 10,
          fontWeight: FontWeight.w300,
          color: AppColor.fontColor,
        ),
      ),
      trailing: const SizedBox(
        width: 50, // Set a specific width for the trailing widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  "5.0",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontColor,
                  ),
                ),
              ],
            ),
            Text(
              "\$20",
              style: TextStyle(
                fontFamily: 'CenturyGothic',
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
