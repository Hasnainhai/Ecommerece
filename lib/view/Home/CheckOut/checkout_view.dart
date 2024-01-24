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
  bool firstButton = true;
  bool secondButton = false;
  bool thirdButton = false;
  bool isChecked = false;
  String? address;
  String? postalCode;
  String? city;
  String? state;
  String? name;
  String? phone;
  String paymentType = 'Stripe';
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            const FastShippingContainer(),
            const VerticalSpeacing(14),
            const Text(
              'Payment option',
              style: TextStyle(
                fontFamily: 'CenturyGothic',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.blackColor,
              ),
            ),
            SizedBox(
                height: 66,
                width: MediaQuery.of(context).size.width,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            firstButton = !firstButton;
                            secondButton = false;
                            thirdButton = false;
                            paymentType = 'Stripe';
                          });
                        },
                        child: Center(
                          child: Container(
                            height: 55,
                            width: 113,
                            decoration: BoxDecoration(
                                color: firstButton
                                    ? AppColor.primaryColor
                                    : Colors.transparent,
                                border: Border.all(
                                    width: 1,
                                    color: firstButton
                                        ? AppColor.primaryColor
                                        : AppColor.primaryColor)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 28.0,
                                  width: 28.0,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/masterCard.png'),
                                          fit: BoxFit.contain)),
                                ),
                                const VerticalSpeacing(5),
                                Text(
                                  "Master Card",
                                  style: TextStyle(
                                      fontFamily: 'CenturyGothic',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                      color: firstButton
                                          ? AppColor.whiteColor
                                          : AppColor.fontColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            firstButton = false;
                            secondButton = false;
                            thirdButton = !thirdButton;
                            paymentType = 'cash on Delivery';
                          });
                        },
                        child: Center(
                          child: Container(
                            height: 55,
                            width: 100,
                            decoration: BoxDecoration(
                              color: thirdButton
                                  ? AppColor.primaryColor
                                  : Colors.transparent,
                              border: Border.all(
                                  width: 1,
                                  color: thirdButton
                                      ? AppColor.primaryColor
                                      : AppColor.primaryColor),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 28.0,
                                  width: 28.0,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/paypal.png'),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const VerticalSpeacing(5),
                                Text(
                                  "PayPal",
                                  style: TextStyle(
                                    fontFamily: 'CenturyGothic',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    color: thirdButton
                                        ? AppColor.whiteColor
                                        : AppColor.fontColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            firstButton = false;
                            secondButton = false;
                            thirdButton = !thirdButton;
                            paymentType = 'cash on Delivery';
                          });
                        },
                        child: Center(
                          child: Container(
                            height: 55,
                            width: 100,
                            decoration: BoxDecoration(
                              color: thirdButton
                                  ? AppColor.primaryColor
                                  : Colors.transparent,
                              border: Border.all(
                                  width: 1,
                                  color: thirdButton
                                      ? AppColor.primaryColor
                                      : AppColor.primaryColor),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 28.0,
                                  width: 28.0,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/cash.png'),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const VerticalSpeacing(5),
                                Text(
                                  "Cash On Delivery",
                                  style: TextStyle(
                                    fontFamily: 'CenturyGothic',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    color: thirdButton
                                        ? AppColor.whiteColor
                                        : AppColor.fontColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]))
          ]),
        ),
      ),
    );
  }
}
