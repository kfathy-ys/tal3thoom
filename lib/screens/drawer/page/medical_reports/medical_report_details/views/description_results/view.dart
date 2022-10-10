import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';

class OverAll extends StatelessWidget {
  final String title1;
  final String title2;
  final String name;
  final String age;
  final String mild;
  const OverAll(
      {Key? key,
      required this.title1,
      required this.title2,
     required this.name, required this.age, required this.mild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            //color: Colors.amber,
            width: context.width,
            height: context.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customText4(title: title2, color: kPrimaryColor),
                customText4(title: title1, color: kTextFieldColor),
              ],
            ),
          ),
          customText7(title: "A total score of the SSI-4 is calculated based on the subscores. The total score for $name during this evaluation was $age indicating the presence of $mild stuttering. The results are summarized on the following table.", color: kBlackText)
        ],
      ),
    );
  }
}
