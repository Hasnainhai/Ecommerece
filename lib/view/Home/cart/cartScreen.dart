import 'package:ecommerece/res/components/rounded_button.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view_model/service/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../res/components/colors.dart';
import '../../../res/components/verticalSpacing.dart';
import 'widgets/cartWidget.dart';
import 'widgets/dottedLine.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartRepositoryProvider>(context, listen: false)
        .getCachedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Cart Page',
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.blackColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => const DashBoardScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.blackColor,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<CartRepositoryProvider>(
                  builder: (context, cartRepoProvider, child) {
                    List<Map<String, dynamic>> cartItems =
                        cartRepoProvider.cartRepositoryProvider.cartList;

                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: CartWidget(
                              productId: cartItems[index]['productId'],
                              name: cartItems[index]['name'],
                              image: cartItems[index]['image'],
                              price: cartItems[index]['price'],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                const VerticalSpeacing(30.0),
                const Text(
                  'Add Coupon',
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColor.fontColor,
                  ),
                ),
                const VerticalSpeacing(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 46,
                      width: MediaQuery.of(context).size.width * 0.55,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.primaryColor, width: 1.0),
                        borderRadius: BorderRadius.zero,
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Voucher Code',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 46.0,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: RoundedButton(
                          color: AppColor.primaryColor,
                          title: 'Apply',
                          onpress: () {}),
                    ),
                  ],
                ),
                const VerticalSpeacing(30.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Items",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                    Text(
                      '6',
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColor.blackColor,
                      ),
                    ),
                    // Consumer<IndexModel>(
                    //   builder: (context, indexModel, child) {
                    //     return Text(
                    //       '${indexModel.items}',
                    //       style: const TextStyle(
                    //         fontFamily: 'CenturyGothic',
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w800,
                    //         color: AppColor.blackColor,
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
                const VerticalSpeacing(12.0),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: DottedLinePainter(),
                  ),
                ),
                const VerticalSpeacing(30.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Coupon dicount",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                    Text(
                      '\$6',
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColor.blackColor,
                      ),
                    ),
                    // Consumer<IndexModel>(
                    //   builder: (context, indexModel, child) {
                    //     return Text(
                    //       '${indexModel.items}',
                    //       style: const TextStyle(
                    //         fontFamily: 'CenturyGothic',
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w800,
                    //         color: AppColor.blackColor,
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
                const VerticalSpeacing(12.0),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: DottedLinePainter(),
                  ),
                ),
                const VerticalSpeacing(12.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shipping",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                    Text(
                      '\$60',
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColor.blackColor,
                      ),
                    ),
                    // Consumer<SubTotalModel>(
                    //   builder: (context, subTotalModel, child) {
                    //     return Text(
                    //       '₹${subTotalModel.subTotal}',
                    //       style: const TextStyle(
                    //         fontFamily: 'CenturyGothic',
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w800,
                    //         color: AppColor.blackColor,
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
                const VerticalSpeacing(12.0),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: DottedLinePainter(),
                  ),
                ),
                const VerticalSpeacing(12.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                    Text(
                      '\$60',
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColor.blackColor,
                      ),
                    ),
                    // Consumer<SubTotalModel>(
                    //   builder: (context, subTotalModel, child) {
                    //     return Text(
                    //       '₹${subTotalModel.subTotal}',
                    //       style: const TextStyle(
                    //         fontFamily: 'CenturyGothic',
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w800,
                    //         color: AppColor.blackColor,
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
                const VerticalSpeacing(30.0),
                SizedBox(
                  height: 46.0,
                  width: double.infinity,
                  child: RoundedButton(
                      color: AppColor.primaryColor,
                      title: 'Process To CheckOut',
                      onpress: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.checkout,
                        );
                      }),
                ),
                const VerticalSpeacing(12.0),
                SizedBox(
                  height: 46.0,
                  width: double.infinity,
                  child: RoundedButton(
                      color: AppColor.blackColor,
                      title: 'return to shipping',
                      onpress: () {}),
                ),
                const VerticalSpeacing(60.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
