import 'package:flutter/material.dart';

import '../../../../../../widgets/constants.dart';

class HeadTitles extends StatelessWidget {
  final String headTitle;
  const HeadTitles({Key? key, required this.headTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
          alignment: Alignment.topRight,
          child: customText10(title: headTitle, color: kBlackText)),
    );
  }
}

class CardItems extends StatelessWidget {
  final String title;
  final String subTitle;
  const CardItems({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText10(title: title, color: kPrimaryColor),
        customText10(title: subTitle, color: kTextFieldColor)
      ],
    );
  }
}
