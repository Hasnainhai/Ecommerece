import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/save/Widgets/save_card.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "Pro Loved",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 16,
            fontWeight: FontWeight.w600,
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
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const SaveCard();
          },
        ),
      )),
    );
  }
}
