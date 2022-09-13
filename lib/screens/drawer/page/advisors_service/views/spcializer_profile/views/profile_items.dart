import 'package:flutter/material.dart';

import '../../../../../../widgets/constants.dart';

class ProfileItems extends StatelessWidget {
  final String title;
  final String subTitle;
  const ProfileItems({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText10(title: title, color: kTextFieldColor),
        customText10(title: subTitle, color: kPrimaryColor)
      ],
    );
  }
}
