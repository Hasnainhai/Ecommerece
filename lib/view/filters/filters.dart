import 'package:ecommerece/repository/home_ui_repository.dart';
import 'package:ecommerece/res/enums.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../res/components/colors.dart';
import '../../res/components/verticalSpacing.dart';
import 'widgets/price_slider.dart';
import 'package:flutter/material.dart';

class FilterPopUp extends StatefulWidget {
  const FilterPopUp({super.key});

  @override
  State<FilterPopUp> createState() => _FilterPopUpState();
}

class _FilterPopUpState extends State<FilterPopUp> {
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool button4 = false;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Filters",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColor.fontColor,
                    ),
                  ),
                ),
                const VerticalSpeacing(30),
                const PriceRangeSlider(),
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.fontColor,
                  ),
                ),
                const VerticalSpeacing(
                  20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          button1 = !button1;
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: button1
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "Sweaters",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: button1
                                  ? AppColor.whiteColor
                                  : AppColor.fontColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          button2 = !button2;
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: button2
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "Uppers",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: button2
                                  ? AppColor.whiteColor
                                  : AppColor.fontColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          button3 = !button3;
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: button3
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "T Shirts",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: button3
                                  ? AppColor.whiteColor
                                  : AppColor.fontColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpeacing(14),
                InkWell(
                  onTap: () {
                    setState(() {
                      button4 = !button4;
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color:
                          button4 ? AppColor.primaryColor : Colors.transparent,
                      border: Border.all(color: AppColor.primaryColor),
                    ),
                    child: Center(
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: button4
                              ? AppColor.whiteColor
                              : AppColor.fontColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalSpeacing(
                  30,
                ),
                const Text(
                  "Rating",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.fontColor,
                  ),
                ),
                const VerticalSpeacing(
                  14,
                ),
                RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    allowHalfRating: true,
                    glowColor: Colors.amber,
                    itemCount: 5,
                    itemSize: 30,
                    itemBuilder: (context, _) => const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {}),
                const VerticalSpeacing(
                  50,
                ),
                InkWell(
                  onTap: () {
                    Provider.of<HomeUiSwithchRepository>(context, listen: false)
                        .switchToType(UIType.FilterSection);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      border: Border.all(
                        color: AppColor.primaryColor,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Add Filters",
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
