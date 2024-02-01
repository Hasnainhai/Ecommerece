// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerece/model/home_prod_model.dart';
import 'package:flutter/material.dart';

import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/pro_loved_card.dart';
import 'package:ecommerece/view/filters/filters.dart';

class PopularsScreen extends StatelessWidget {
  List<Products> productsTopOrder;
  PopularsScreen({
    Key? key,
    required this.productsTopOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "Populars",
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
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: (MediaQuery.of(context).size.width) - 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search Here",
                    helperStyle: const TextStyle(color: AppColor.fieldBgColor),
                    filled: true,
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FilterPopUp(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.tune_sharp,
                        color: AppColor.fontColor,
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalSpeacing(20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: productsTopOrder.length,
                  itemBuilder: (context, index) {
                    Products product = productsTopOrder[index];

                    return ProLovedCard(
                      fun: () {
                        Navigator.pushNamed(context, RoutesName.productdetail);
                      },
                      name: product.title,
                      rating: product.averageReview,
                      price: product.price,
                      discount: product.discount.toString(),
                    );
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
