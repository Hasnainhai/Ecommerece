import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TotalReviewCard extends StatelessWidget {
  const TotalReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 142,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColor.fieldBgColor,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/474x/e7/a9/4b/e7a94b352d281a23d847a13352be652c.jpg',
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Rayees",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff295D8B),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 4,
                                    unratedColor: const Color(0xffD6F0F9),
                                    minRating: 1,
                                    allowHalfRating: true,
                                    glowColor: Colors.amber,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  const Text(
                                    "5.0",
                                    style: TextStyle(
                                      fontFamily: 'CenturyGothic',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff5790B9),
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "23 Oct, 2021",
                                style: TextStyle(
                                  fontFamily: 'CenturyGothic',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff7FBADC),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Text(
                  "You probably take vitamins and supplements with the goal of improving your health. ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7FBADC),
                  ),
                ),
              ],
            ),
          ),
        ),
        const VerticalSpeacing(
          20,
        ),
      ],
    );
  }
}
