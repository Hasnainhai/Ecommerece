// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../res/components/colors.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({
    super.key,
    required this.title,
    required this.img,
    required this.rating,
    required this.address,
  });
  final String title;
  final String img;
  final String rating;
  final String address;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        isThreeLine: false,
        leading: const CircleAvatar(
          radius: 35.0,
          backgroundColor: AppColor.primaryColor,
          backgroundImage: NetworkImage(
              'https://www.shutterstock.com/image-vector/red-store-vector-sign-promotion-260nw-1918121837.jpg'),
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 14.0,
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600,
              fontFamily: 'CenturyGothic'),
        ),
        subtitle: Text.rich(
          TextSpan(
              text: address,
              style: const TextStyle(
                  fontSize: 14.0,
                  color: AppColor.fontColor,
                  fontFamily: 'CenturyGothic'),
              children: [
                TextSpan(
                  text: '\n⭐️ $rating',
                  style: const TextStyle(
                      fontSize: 14.0,
                      color: AppColor.fontColor,
                      fontFamily: 'CenturyGothic'),
                )
              ]),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: AppColor.blackColor,
        ));
  }
}
