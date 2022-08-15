import 'package:flutter/material.dart';

import '../../../../../../widgets/constants.dart';
class DescriptionResult extends StatelessWidget {

  final String title1;
  final String title2;
  final String subTitle;
  const DescriptionResult({Key? key, required this.title1, required this.title2, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            //color: Colors.amber,
            width: width,
            height: height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customText4(title: title2, color: kPrimaryColor),
                customText4(title: title1, color: kTextFieldColor),
              ],
            ),
          ),
          customText7(title: subTitle, color: kBlackText)
        ],
      ),
    );
  }
}



