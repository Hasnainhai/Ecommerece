import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/PreLovedProductDetail/Widget/image_slider.dart';
import 'package:ecommerece/view/Home/ProductDetail/widgets/color_container.dart';
import 'package:ecommerece/view/Home/ProductDetail/widgets/size_container.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/pro_loved_card.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
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
              const Text(
                "Size: ",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(
                18,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizeContainer(
                    color: AppColor.primaryColor,
                    title: "S",
                    fontColor: AppColor.whiteColor,
                  ),
                  SizeContainer(
                    color: AppColor.whiteColor,
                    title: "M",
                    fontColor: AppColor.fontColor,
                  ),
                  SizeContainer(
                    color: AppColor.whiteColor,
                    title: "L",
                    fontColor: AppColor.fontColor,
                  ),
                  SizeContainer(
                    color: AppColor.whiteColor,
                    title: "Xl",
                    fontColor: AppColor.fontColor,
                  ),
                  SizeContainer(
                    color: AppColor.whiteColor,
                    title: "2xl",
                    fontColor: AppColor.fontColor,
                  ),
                ],
              ),
              const VerticalSpeacing(
                16,
              ),
              const Text(
                "Select Color",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.fontColor,
                ),
              ),
              const VerticalSpeacing(
                16,
              ),
              const Row(
                children: [
                  ColorContainer(color: Color(0xffFFD700)),
                  SizedBox(
                    width: 6,
                  ),
                  ColorContainer(color: Color(0xffAE1B1B)),
                  SizedBox(
                    width: 6,
                  ),
                  ColorContainer(color: Color(0xff5B36EF)),
                  SizedBox(
                    width: 6,
                  ),
                  ColorContainer(color: Color(0xffD01363)),
                  SizedBox(
                    width: 6,
                  ),
                  ColorContainer(color: Color(0xffFF06B9)),
                  SizedBox(
                    width: 6,
                  ),
                  ColorContainer(color: Color(0xffFF1313)),
                  SizedBox(
                    width: 6,
                  ),
                  ColorContainer(color: Color(0xff15F8C1)),
                ],
              ),
              const VerticalSpeacing(
                20,
              ),
              const Divider(
                color: Color(0xffBCBCBC),
              ),
              const VerticalSpeacing(
                16,
              ),
              const Text(
                "Related product",
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.fontColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProLovedCard(
                    fun: () {
                      Navigator.pushNamed(context, RoutesName.productdetail);
                    },
                  ),
                  ProLovedCard(
                    fun: () {
                      Navigator.pushNamed(context, RoutesName.productdetail);
                    },
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
