import 'package:ecommerece/view_model/service/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../res/components/colors.dart';

int subTotal = 0;

// ignore: must_be_immutable
class CartWidget extends StatefulWidget {
  const CartWidget(
      {super.key,
      required this.productId,
      required this.name,
      required this.image,
      required this.price,
      required this.onpress,
      required this.quantity});
  final String productId;
  final String name;
  final String image;
  final String price;
  final VoidCallback onpress;
  final int quantity;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
        shape: const RoundedRectangleBorder(),
        color: AppColor.whiteColor,
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: ListTile(
              leading: SizedBox(
                  height: 80.0,
                  width: 58.0,
                  child: Image.asset('images/coat.png')),
              title: Row(
                children: [
                  const SizedBox(width: 30.0),
                  Text.rich(
                    TextSpan(
                        text: '${widget.name}\n',
                        style: const TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColor.fontColor,
                        ),
                        children: const [
                          TextSpan(
                            text: 'Duis aute veniam',
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                              color: AppColor.fontColor,
                            ),
                          )
                        ]),
                  ),
                ],
              ),
              // Incremental Buttons
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Row(
                  children: [
                    const SizedBox(width: 30.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.primaryColor),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(
                              height: 2,
                              thickness: 2.5,
                              color: AppColor.primaryColor,
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      widget.quantity.toString(),
                      style: const TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.fontColor,
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<CartRepositoryProvider>(context,
                                listen: false)
                            .addQuantity(widget.quantity);
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.primaryColor,
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: widget.onpress,
                    child: const Icon(
                      Icons.delete_outline,
                      color: AppColor.fontColor,
                      size: 24,
                    ),
                  ),
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
