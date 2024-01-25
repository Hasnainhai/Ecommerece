import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:flutter/material.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: const Text(
          "My wishlist",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4,
                    ),
                    color: AppColor.fieldBgColor,
                  ),
                  child: Center(
                    child: Container(
                      height: 125,
                      width: 125,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/done.png"))),
                    ),
                  ),
                ),
              ),
              const VerticalSpeacing(
                52,
              ),
              const Text(
                "item not found in wallet",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(
                12,
              ),
              const Text(
                "Sorry you n’t haven’t placed\nany order yet. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(
                110,
              ),
              RoundedButton(
                title: "Go Back",
                onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => const DashBoardScreen(),
                    ),
                  );
                },
                color: AppColor.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
