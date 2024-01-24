import 'package:flutter/material.dart';

class BidingTile extends StatelessWidget {
  const BidingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 43,
        width: 60,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/coat.png"),
        )),
      ),
    );
  }
}
