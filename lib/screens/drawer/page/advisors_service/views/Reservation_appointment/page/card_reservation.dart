import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/mediaButton.dart';
import 'card_item.dart';
import 'custom_container.dart';

class ReservationsCard extends StatelessWidget {
  final String specialistName;
  final String sessionDate;
  final String start;
  final String end;
  final VoidCallback onTap;
  const ReservationsCard(
      {Key? key,
      required this.specialistName,
      required this.sessionDate,
      required this.start,
      required this.end,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return CustomContainer(
      height: context.height * 0.33,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CardItems(title: "المتخصص", subTitle: specialistName),
          CardItems(title: "تاريخ الجلسة", subTitle: sessionDate),
          CardItems(title: "وقت البداية", subTitle: start),
          CardItems(title: "وقت النهاية", subTitle: end),
          MediaButton(
            onPressed: onTap,

            //     () {
            //   navigateTo(context, PaymentAdvisor());
            // },
            color: kButtonGreenDark,
            title: "حجز جلسة",
          ),
        ],
      ),
    );
  }
}
