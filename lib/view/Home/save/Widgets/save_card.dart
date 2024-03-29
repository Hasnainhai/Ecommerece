import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/view_model/service/save_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveCard extends StatelessWidget {
  const SaveCard(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.id});
  final String name;
  final String price;
  final String image;
  final String id;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 82,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/coat.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.fontColor,
                        ),
                      ),
                      const Text(
                        "Duis aute veniam veniam qui aliquip irure  ",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: AppColor.fontColor,
                        ),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: AppColor.fontColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Provider.of<SaveProductRepositoryProvider>(context,
                                    listen: false)
                                .deleteProduct(id);
                          },
                          child: const Icon(Icons.delete_outline)),
                      const VerticalSpeacing(20),
                      const Icon(Icons.shopping_bag_outlined),
                    ],
                  )
                ],
              ),
            ],
          ),
          const VerticalSpeacing(12),
          const Divider(
            color: Color(0xffECECEC),
          )
        ],
      ),
    );
  }
}
