import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';

class Tables extends StatelessWidget {
  final Color textColor;
  final Color color;
  final String title1;
  final String title2;
  final String title3;
  const Tables(
      {Key? key,
      required this.textColor,
      required this.color,
      required this.title1,
      required this.title2,
      required this.title3})
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
        // mainAxisSize: MainAxisSize.min,

        children: [
          customText3(title: title1, color: textColor),
          customText3(title: title2, color: textColor),
          customText3(title: title3, color: textColor)
        ],
      ),
    );
  }
}
