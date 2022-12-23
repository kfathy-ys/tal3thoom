import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';

class FourTables extends StatelessWidget {
  final Color textColor;
  final Color color;
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final String title5;
  const FourTables(
      {Key? key,
      required this.textColor,
      required this.color,
      required this.title1,
      required this.title2,
      required this.title3,
      required this.title4,
      required this.title5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      height: context.height * 0.059,
      width: context.width,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: kAppBarColor),
        //  borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          custom12Text(title: title1, color: textColor),
          custom12Text(title: title2, color: textColor),
          custom12Text(title: title3, color: textColor),
          custom12Text(title: title4, color: textColor),
          custom12Text(title: title5, color: textColor)
        ],
      ),
    );
  }
}
