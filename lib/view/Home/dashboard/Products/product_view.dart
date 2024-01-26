import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/pro_loved/Widgets/pro_loved_card.dart';
import 'package:ecommerece/view/filters/filters.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: const Text(
          "Product",
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
          padding: const EdgeInsets.all(
            20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: (MediaQuery.of(context).size.width) - 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search Here",
                      helperStyle:
                          const TextStyle(color: AppColor.fieldBgColor),
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
                const VerticalSpeacing(16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Populars',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'CenturyGothic',
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.popularsScreen);
                      },
                      child: const Text(
                        'see more',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'CenturyGothic',
                            color: AppColor.fontColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const VerticalSpeacing(14),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ProLovedCard(
                      fun: () {
                        Navigator.pushNamed(context, RoutesName.productdetail);
                      },
                    );
                  },
                ),
                const VerticalSpeacing(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Our new items',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'CenturyGothic',
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.newItemsScreen);
                      },
                      child: const Text(
                        'see more',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'CenturyGothic',
                            color: AppColor.fontColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const VerticalSpeacing(14),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ProLovedCard(
                      fun: () {
                        Navigator.pushNamed(context, RoutesName.productdetail);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
