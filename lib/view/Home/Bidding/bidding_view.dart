import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/view/Home/Bidding/Widget/bidding_card_widget.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:flutter/material.dart';

class BiddingView extends StatefulWidget {
  const BiddingView({super.key});

  @override
  State<BiddingView> createState() => _BiddingViewState();
}

class _BiddingViewState extends State<BiddingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: const Text(
          "Bidding  request",
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
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const BiddingCard();
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
