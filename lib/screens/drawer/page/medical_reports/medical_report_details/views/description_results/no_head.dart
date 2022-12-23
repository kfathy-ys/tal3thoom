import 'package:flutter/material.dart';

import '../../../../../../widgets/constants.dart';

class NoHead extends StatelessWidget {
  final String impactRating;
  final String name;
  final String her;

  const NoHead({
    Key? key,
    required this.impactRating,
    required this.name,
    required this.her,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: customText7(
          title:
              "The score of SSRS for $name during this evaluation was indicating the presence of dissatisfaction of his speech.OASES revealed that $name stuttering has a $impactRating impact on $her general information, and reaction to stuttering. $her quality of life and communication in daily situations reaction to $her stuttering were found to have a $impactRating on $her communication. The table below shows the impact ratings for $name for the four sections of the OASES instrument, as well as the overall test.",
          color: kBlackText),
    );
  }
}
