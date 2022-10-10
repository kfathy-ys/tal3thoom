import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/constants.dart';
import '../../../../widgets/customButton.dart';

class CardItems extends StatelessWidget {
  final String subTitleReportName;
  final String subTitleSpecialistName;
  final String subTitleDate;
  final VoidCallback onPressed;

  const CardItems(
      {Key? key,
      required this.onPressed,
      required this.subTitleReportName,
      required this.subTitleSpecialistName,
      required this.subTitleDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: context.height * 0.3,
      width: context.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kTextFieldColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRow(title: "أسم التقارير", subTitle: subTitleReportName),
          buildRow(title: "أسم المتخصص", subTitle: subTitleSpecialistName),
          buildRow(title: "تاريخ الإصدار", subTitle: subTitleDate),
          CustomButton(
            title: "عرض التقرير",
            color: kPrimaryColor,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }

  Widget buildRow({required String title, required String subTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText10(title: title, color: kPrimaryColor),
        customText10(title: subTitle, color: kBlackText)
      ],
    );
  }
}
