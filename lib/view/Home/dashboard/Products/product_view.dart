import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
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
          ],
        ),
      )),
    );
  }
}
