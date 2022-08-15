import 'package:flutter/material.dart';

import '../../../../../../widgets/constants.dart';
class HeadSubHead extends StatelessWidget {

  final String head1;
  final String head2;
  final String sunHead;
  const HeadSubHead({Key? key, required this.head1, required this.head2, required this.sunHead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        //mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            // color: Colors.amber,
            width: width * 0.55,
            height: height * 0.05,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                customText10(title: head1, color: kPrimaryColor),
                customText10(title: head2, color: kTextFieldColor)
              ],
            ),
          ),
          customText10(title: sunHead, color: kBlackText)
        ],
      ),
    );
  }
}


