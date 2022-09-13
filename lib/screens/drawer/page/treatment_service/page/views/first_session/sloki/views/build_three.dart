import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../widgets/constants.dart';

class BuildTable extends StatelessWidget {
  final Color color;
  final String title1;
  final String title2;
  final String title3;
  const BuildTable(
      {Key? key,
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
      width: context.width * 0.8,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: kAppBarColor),
        //  borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisSize: MainAxisSize.min,
        children: [
          customText3(title: title1, color: kBlackText),
          customText3(title: title2, color: kBlackText),
          customText3(title: title3, color: kBlackText)
        ],
      ),
    );
  }
}
