// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/custom_text_field.dart';
import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/view/Home/Review/Widgets/review_complete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  const Rating({
    super.key,
  });

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.fontColor,
            )),
        title: const Text(
          "Review",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.fontColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const VerticalSpeacing(
                  55,
                ),
                RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    allowHalfRating: true,
                    glowColor: Colors.amber,
                    itemCount: 5,
                    itemSize: 55,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                    itemBuilder: (context, _) => const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {}),
                const VerticalSpeacing(25),
                // TextFieldCustom(
                //   controller: commentController,
                //   maxLines: 6,
                //   hintText: "Additional comments...",
                //   text: 'Leave a your valuable comments',
                // ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Your Review",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1D4877),
                      ),
                    ),
                  ],
                ),
                const TextField(
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText:
                        'You probably take vitamins and supplements with the goal of improving your health. ',
                    hintStyle: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1D4877),
                    ),
                    fillColor: Color(0xffEEEEEE),
                    border: InputBorder.none,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Word Count: ${commentController.text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const VerticalSpeacing(30),
                RoundedButton(
                  color: AppColor.primaryColor,
                  title: 'Submmit Review',
                  onpress: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const ReviewCompleteDialog(),
                    );
                  },
                ),
                const VerticalSpeacing(40)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
