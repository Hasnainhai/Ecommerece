import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/view/Home/Review/Widgets/total_review_card.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TotalReveiw extends StatefulWidget {
  const TotalReveiw({super.key});

  @override
  State<TotalReveiw> createState() => _TotalReveiwState();
}

class _TotalReveiwState extends State<TotalReveiw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: const Text(
          "Reviews",
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
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "4.0",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5790B9),
                    ),
                  ),
                  Text(
                    "/5",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5790B9),
                    ),
                  ),
                ],
              ),
              RatingBar.builder(
                initialRating: 4,
                unratedColor: const Color(0xffD6F0F9),
                minRating: 1,
                allowHalfRating: true,
                glowColor: Colors.amber,
                itemCount: 5,
                itemSize: 40,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const VerticalSpeacing(12),
              const Text(
                "based on 456 reviews",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5790B9),
                ),
              ),
              const VerticalSpeacing(
                46,
              ),
              const Divider(
                color: Color(0xff5790B9),
              ),
              const VerticalSpeacing(
                22,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const TotalReviewCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
