import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/customButton.dart';

class ReservationCard extends StatelessWidget {
  final String subTitleData;
  final String subTitleDay;
  final String subTitleFinishSessionDate;
  final String subTitleStartSessionData;
  final String subTitleTypeAppointment;
  final String subTitleEvaluation;
  final VoidCallback onPressStart;
  final VoidCallback onPressEnd;
  const ReservationCard(
      {Key? key,
      required this.onPressStart,
      required this.onPressEnd,
      required this.subTitleData,
      required this.subTitleDay,
      required this.subTitleFinishSessionDate,
      required this.subTitleStartSessionData,
      required this.subTitleTypeAppointment,
      required this.subTitleEvaluation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: context.height * 0.45,
      width: context.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kTextFieldColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cardItems(title: "التاريخ الإصدار", subTitle: subTitleData),
          cardItems(title: "اليوم", subTitle: subTitleDay),
          cardItems(title: "بدء الجلسة", subTitle: subTitleStartSessionData),
          cardItems(title: "انتهاء الجلسة", subTitle:subTitleFinishSessionDate ),
          cardItems(title: "نوع الموعد", subTitle: subTitleTypeAppointment),
          cardItems(title: "التقيم", subTitle: subTitleEvaluation),
          CustomButton(
            title: "بدء الجلسة",
            color: kButtonGreenDark,
            onPressed: onPressStart,
          ),
          CustomButton(
            title: "إلغاء",
            color: kButtonDashBoard,
            onPressed: onPressEnd,
          )
        ],
      ),
    );
  }

  Widget cardItems({required String title, required String subTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText10(title: title, color: kPrimaryColor),
        customText10(title: subTitle, color: kBlackText)
      ],
    );
  }
}
