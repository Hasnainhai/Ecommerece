import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:flutter/material.dart';

class ProLovedCard extends StatefulWidget {
  const ProLovedCard({super.key, required this.fun});
  final Function fun;
  @override
  State<ProLovedCard> createState() => _ProLovedCardState();
}

class _ProLovedCardState extends State<ProLovedCard> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fun(),
      child: Container(
        height: 200,
        width: 168,
        color: const Color(0xffF9F9F9),
        child: Column(children: [
          const VerticalSpeacing(8),
          Container(
            height: 100,
            width: 146,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/coat.png"),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isLike = !isLike;
                    });
                  },
                  child: Icon(
                    Icons.favorite,
                    color: isLike
                        ? AppColor.primaryColor
                        : const Color(0xfff6f6f6f6),
                  ),
                )
              ],
            ),
          ),
          const VerticalSpeacing(7),
          const Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upper winter",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontColor,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 12,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: AppColor.fontColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const VerticalSpeacing(4),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      "\$600",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: AppColor.fontColor,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "\$900",
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: AppColor.fontColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 18,
                      width: 44,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: const Center(
                        child: Text(
                          "Visit",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
