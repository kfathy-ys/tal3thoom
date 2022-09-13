import 'package:flutter/material.dart';

import '../../../../../../../../widgets/constants.dart';

class CustomRadio extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String number;
  const CustomRadio(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          customText3(title: number, color: kBlackText),
        ],
      ),
    );
  }
}
