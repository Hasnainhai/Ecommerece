import 'package:flutter/material.dart';

import '../../res/components/colors.dart';
import '../../res/components/verticalSpacing.dart';
import '../../utils/routes/routes_name.dart';
import '../Home/pro_loved/Widgets/pro_loved_card.dart';

class VisitStore extends StatelessWidget {
  const VisitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "Best day cloth house",
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
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                const VerticalSpeacing(27.0),
                SizedBox(
                  height: 60,
                  width: (MediaQuery.of(context).size.width) - 40,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Search",
                      helperStyle: TextStyle(color: AppColor.fieldBgColor),
                      filled: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      suffixIcon: Icon(
                        Icons.tune_sharp,
                        color: AppColor.fontColor,
                      ),
                    ),
                  ),
                ),
                const VerticalSpeacing(20.0),
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
                const VerticalSpeacing(16.0),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ProLovedCard(
                        fun: () {
                          Navigator.pushNamed(
                              context, RoutesName.productdetail);
                        },
                      );
                    },
                  ),
                ),
                const VerticalSpeacing(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'New T Shirts',
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
                const VerticalSpeacing(16.0),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ProLovedCard(
                        fun: () {
                          Navigator.pushNamed(
                              context, RoutesName.productdetail);
                        },
                      );
                    },
                  ),
                ),
                const VerticalSpeacing(40.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
