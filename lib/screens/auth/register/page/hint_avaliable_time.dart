import 'package:flutter/material.dart';
import 'package:queen/queen.dart';

import '../../../widgets/constants.dart';

class HintAvailableTime extends StatelessWidget {
  const HintAvailableTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: context.height * 0.049,
      width: context.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kBackGroundCard,
      ),
      child: Center(
        child: customText7(title: "الاوقات المتاحة", color: kPrimaryColor),
      ),
    );
  }
}
