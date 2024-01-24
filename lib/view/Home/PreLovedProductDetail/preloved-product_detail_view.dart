import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/view/Home/PreLovedProductDetail/Widget/image_slider.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/bid_dialog.dart';
import 'package:flutter/material.dart';

class PreLovedProductDetailView extends StatefulWidget {
  const PreLovedProductDetailView({super.key});

  @override
  State<PreLovedProductDetailView> createState() =>
      _PreLovedProductDetailViewState();
}

class _PreLovedProductDetailViewState extends State<PreLovedProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: const Text(
          "Product Details",
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
              const ImageSlider(),
              const VerticalSpeacing(30),
              const Text(
                "Cauliflower Bangladeshi",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(10),
              const Row(
                children: [
                  Text(
                    "\$900",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontColor,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "\$600",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(16),
              const Text(
                "Product Details",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryColor,
                ),
              ),
              const VerticalSpeacing(12),
              const Text(
                "Duis aute veniam veniam qui aliquip irure duis sint magna occaecat dolore nisi culpa do. Est nisi incididunt aliquip  commodo aliqua tempor.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(
                20,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (c) => TotalRatingScreen(
                  //         productType: "products",
                  //         productId: widget.productId),
                  //   ),
                  // );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Review",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.fontColor,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.navigate_next,
                          size: 28,
                          color: Color(0xff222222),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const VerticalSpeacing(
                20,
              ),
              const Divider(
                color: Color(0xffBCBCBC),
              ),
              const VerticalSpeacing(
                24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => BidDialog(),
                      );
                    },
                    child: Container(
                      height: 34,
                      width: 92,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColor.whiteColor,
                          ),
                          Text(
                            "Bid now",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 34,
                    width: 132,
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: AppColor.primaryColor,
                        ),
                        Text(
                          "Add to wishlist",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.fontColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 34,
                    width: 104,
                    decoration: BoxDecoration(
                      color: AppColor.fieldBgColor,
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Review",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColor.fontColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
