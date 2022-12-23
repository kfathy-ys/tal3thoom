import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../widgets/constants.dart';

class CardNumber extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isSelected;

  const CardNumber(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? kDarkPrimaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        width: context.width * 0.15,
        height: context.height * 0.079,
        child: Center(
          child: customText2(title: title, color: Colors.white),
        ),
      ),
    );
  }
}
