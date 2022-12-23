import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../widgets/constants.dart';

// ignore: must_be_immutable
class DepartmentCard extends StatelessWidget {
  final String title;
  final bool? isSelected;

  const DepartmentCard({Key? key, required this.title, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      height: context.height * 0.079,
      decoration: BoxDecoration(
        color: isSelected! ? kPrimaryColor : kPrimaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: customText8(title: title, color: kHomeColor),
      ),
    );
  }
}
