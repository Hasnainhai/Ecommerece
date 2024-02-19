import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/repository/home_ui_repository.dart';
import 'package:ecommerece/res/enums.dart';
import 'package:ecommerece/view_model/home_view_model.dart';
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
  RangeValues _values = const RangeValues(5, 1000);

  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool button4 = false;
  String catergioes = "study";
  double minPrice = 5;
  double maxPrice = 5000;
  double maxRating = 4.5;

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
                Container(
                  height: 75, // Adjust the height as needed
                  width: double.infinity,
                  color: Colors.white, // Set the desired background color
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price Range: \$${_values.start.toInt()} - \$${_values.end.toInt()}',
                        style: const TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackColor,
                        ),
                      ),
                      RangeSlider(
                        activeColor: AppColor.primaryColor,
                        inactiveColor: Colors.grey.shade300,
                        values: _values,
                        min: 5,
                        max: 5000,
                        divisions: 100,
                        labels: RangeLabels(
                          _values.start.round().toString(),
                          _values.end.round().toString(),
                        ),
                        onChanged: (values) {
                          setState(() {
                            _values = values;
                          });
                        },
                      ),
                    ],
                  ),
                ),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Consumer<HomeRepositoryProvider>(
                    builder: (context, homeRepo, child) {
                      if (homeRepo.homeRepository.productCategories.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              homeRepo.homeRepository.productCategories.length,
                          itemExtent: MediaQuery.of(context).size.width / 4.6,
                          itemBuilder: (BuildContext context, int index) {
                            Category category = homeRepo
                                .homeRepository.productCategories[index];

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      8.0), // Adjust the horizontal spacing here
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    catergioes = category.name;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    // color: button1
                                    //     ? AppColor.primaryColor
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: AppColor.primaryColor),
                                  ),
                                  child: Center(
                                    child: Text(
                                      category.name,
                                      style: const TextStyle(
                                        fontFamily: 'CenturyGothic',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.fontColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
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
                    onRatingUpdate: (rating) {
                      setState(() {
                        maxRating = rating;
                      });
                    }),
                const VerticalSpeacing(
                  50,
                ),
                InkWell(
                  onTap: () {
                    Provider.of<HomeRepositoryProvider>(context, listen: false)
                        .filterProducts(
                      catergioes,
                      maxRating,
                      minPrice,
                      maxPrice,
                    );
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
