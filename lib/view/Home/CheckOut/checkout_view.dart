import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/custom_text_field.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
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
  bool switchValue = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();

  TextEditingController expDateController = TextEditingController();

  TextEditingController csvController = TextEditingController();

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
          child: SingleChildScrollView(
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
                      const SizedBox(width: 16.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            firstButton = false;
                            secondButton = !secondButton;
                            thirdButton = false;
                            paymentType = 'cash on Delivery';
                          });
                        },
                        child: Center(
                          child: Container(
                            height: 55,
                            width: 100,
                            decoration: BoxDecoration(
                              color: secondButton
                                  ? AppColor.primaryColor
                                  : Colors.transparent,
                              border: Border.all(
                                  width: 1,
                                  color: secondButton
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
                                    color: secondButton
                                        ? AppColor.whiteColor
                                        : AppColor.fontColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
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
                ]),
              ),
              VerticalSpeacing(22),
              TextFieldCustom(
                controller: nameController,
                maxLines: 1,
                text: "Card Name",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  } else {
                    return null;
                  }
                },
              ),
              TextFieldCustom(
                controller: cardNumberController,
                maxLines: 1,
                text: "Card Number",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldCustom(
                      controller: expDateController,
                      maxLines: 1,
                      text: "Expire Date",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextFieldCustom(
                      controller: csvController,
                      maxLines: 1,
                      text: "CSV",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Remeber My Card Details',
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        switchValue = !switchValue;
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 26.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        color: switchValue
                            ? AppColor.primaryColor
                            : const Color(0xffECECEC),
                      ),
                      child: Row(
                        mainAxisAlignment: switchValue
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 4, right: 4),
                            width: 18.0,
                            height: 18.0,
                            decoration: const BoxDecoration(
                              // shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const VerticalSpeacing(34),
              RoundedButton(
                  title: "Make payment pkr 2345",
                  onpress: () {},
                  color: AppColor.primaryColor),
            ]),
          ),
        ),
      ),
    );
  }
}
