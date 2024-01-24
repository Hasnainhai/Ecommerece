import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/view/Home/CheckOut/Widgets/address_select_widget.dart';
import 'package:ecommerece/view/Home/CheckOut/Widgets/fast_shipping_container.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: const Text(
          "Checkout",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: AppColor.fontColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.fontColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => const DashBoardScreen(),
              ),
            );
          },
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select delivery address',
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Add New',
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpeacing(16),
            const AddressSelectWidget(),
            const VerticalSpeacing(20),
            const Text(
              'Shipping option',
              style: TextStyle(
                fontFamily: 'CenturyGothic',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.blackColor,
              ),
            ),
            const VerticalSpeacing(14),
            FastShippingContainer()
          ],
        ),
      )),
    );
  }
}
