import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';

class TestingCase extends StatelessWidget {
  final String title1;
  final String title2;
  final String name;

  const TestingCase({
    Key? key,
    required this.title1,
    required this.title2,
    required this.name,
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
                  "The Stuttering Severity Instrument-Fourth Edition (SSI-4) was administered to determine the frequency, duration, and severity of the stuttering as well as any physical concomitants (e.g., secondary characteristics such as facial tension, body movements, eye blink, etc.) which were present. Two samples of $name speech (reading and conversational speech) were analyzed and used to determine severity of stuttering. Samples are examined for the number and percentage of syllables stuttered (%SS) and a calculation is made of the average of the 3 longest stuttering events in the samples.",
              color: kBlackText)
        ],
      ),
    );
  }
}
/*
* Testpayment is a 0 years old male . He came to the SHS therapeutic approach for a fluency evaluation/treatment due to his concern over persistent stuttering. Specifically Testpayment was concerned that the stuttering was becoming worse and frustration was decreasing.*/
