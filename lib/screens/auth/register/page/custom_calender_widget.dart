import 'package:flutter/material.dart';
import 'package:queen/queen.dart';

import '../../../widgets/constants.dart';
class CustomCalender extends StatelessWidget {
  final Widget child;
  const CustomCalender({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: context.height * 0.42,
      width: context.width * 0.8,
      padding:
      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin:
      const EdgeInsets.symmetric(
          horizontal: 28, vertical: 14),

      decoration: BoxDecoration(
          border: Border.all(color: kSafeAreasColor),
          color: kHomeColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset:
              const Offset(
                  0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
