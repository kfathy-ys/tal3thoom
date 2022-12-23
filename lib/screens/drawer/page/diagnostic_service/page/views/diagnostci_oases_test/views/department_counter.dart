import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../widgets/constants.dart';

class DepartmentCounter extends StatelessWidget {
  final String head;
  const DepartmentCounter({Key? key, required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // customText9(title: "القسم: \t ", color: kPrimaryColor),
            Expanded(child: customText9(title: head, color: kBlackText)),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          color: kBlackText,
          width: context.width * 0.9,
          height: context.height * 0.002,
        ),
      ],
    );
  }
}
