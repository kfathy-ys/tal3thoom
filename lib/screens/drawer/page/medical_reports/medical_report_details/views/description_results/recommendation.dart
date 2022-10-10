import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';

class Recommended extends StatelessWidget {
  final String title1;
  final String title2;
  final String name;
  final String her;
  final String mild;
 final String doctorDep;
  final String doctorName;


  const Recommended({Key? key,
    required this.title1,
    required this.title2,
    required this.name,
    required this.mild,
    required this.her, required this.doctorDep, required this.doctorName,
  })
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
          customText7(
              title:"$name exhibits $mild stuttering as evidenced by fluency testing results, observations, and the client information. It is strongly recommended that $name attend their scheduled speech therapeutic sessions to improve $her fluency, social, academic and communication skills.\n Sincerely,\n ,MSC, $doctorDep \n Speech Pathologist\n Approved By\n Supervisor $doctorName",
              color: kBlackText)
        ],
      ),
    );
  }
}
