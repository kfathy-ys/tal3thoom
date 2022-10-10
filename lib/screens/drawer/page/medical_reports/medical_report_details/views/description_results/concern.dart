import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';

class ConcernResult extends StatelessWidget {
  final String title1;
  final String title2;
  final String name;
  final String age;
  final String sex;
  final String fav;
  final String cases;

  const ConcernResult(
      {Key? key,
      required this.title1,
      required this.title2,
      required this.name,
        required this.age,
        required this.sex,
        required this.fav, required this.cases})
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
          customText7(title: "$name is a $age years old $sex . He came to the SHS therapeutic approach for a fluency evaluation/treatment due to $fav concern over persistent stuttering. Specifically $name was concerned that the stuttering was becoming $cases.", color: kBlackText)
        ],
      ),
    );
  }
}
/*
* Testpayment is a 0 years old male . He came to the SHS therapeutic approach for a fluency evaluation/treatment due to his concern over persistent stuttering. Specifically Testpayment was concerned that the stuttering was becoming worse and frustration was decreasing.*/
