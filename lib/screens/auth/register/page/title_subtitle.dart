// ignore_for_file: non_constant_identifier_names

import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/keys.dart';

class TextTitleSubTitle extends StatelessWidget {
  final String HeadTitle;
  const TextTitleSubTitle({Key? key, required this.HeadTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customBoldText(color: kPrimaryColor, title: KeysConfig.rest),
        customBoldText(color: kBlackText, title: HeadTitle)
      ],
    );
  }
}
