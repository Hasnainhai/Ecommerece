// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../res/components/colors.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
        isThreeLine: false,
        leading: CircleAvatar(
          radius: 35.0,
          backgroundColor: AppColor.primaryColor,
          backgroundImage: NetworkImage(
              'https://www.shutterstock.com/image-vector/red-store-vector-sign-promotion-260nw-1918121837.jpg'),
        ),
        title: Text(
          'best day cloth house',
          style: TextStyle(
              fontSize: 14.0,
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600,
              fontFamily: 'CenturyGothic'),
        ),
        subtitle: Text.rich(
          TextSpan(
              text: 'New hussaiabad',
              style: TextStyle(
                  fontSize: 14.0,
                  color: AppColor.fontColor,
                  fontFamily: 'CenturyGothic'),
              children: [
                TextSpan(
                  text: '\n⭐️ 4.5 rating',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: AppColor.fontColor,
                      fontFamily: 'CenturyGothic'),
                )
              ]),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: AppColor.blackColor,
        ));
  }
}
