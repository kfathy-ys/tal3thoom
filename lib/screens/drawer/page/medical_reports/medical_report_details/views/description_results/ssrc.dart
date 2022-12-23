import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';

class SSRCCase extends StatelessWidget {
  final String title1;
  final String title2;
  final String name;
  final String her;

  const SSRCCase({
    Key? key,
    required this.title1,
    required this.title2,
    required this.name,
    required this.her,
  }) : super(key: key);

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
          customText7(
              title:
                  "$name was evaluated in relation to $her overall speech satisfaction. This is achieved through the implementation of a self-rating scale, utilising 11 points, with 10 = the best judgement and 0 = the worst judgment. Accordingly, the score was made with consideration of various elements of stuttering, such as negative emotional and cognitive reactions, reactions of listeners, and stuttering severity.",
              color: kBlackText)
        ],
      ),
    );
  }
}
