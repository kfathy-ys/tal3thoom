import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/keys.dart';

import '../../../../../widgets/constants.dart';

// ignore: must_be_immutable
class AdvisorsService extends StatelessWidget {
  final VoidCallback onTapInductions;

  final VoidCallback onTapAppointmentReservation;

  const AdvisorsService(
      {super.key,
      required this.onTapInductions,
      required this.onTapAppointmentReservation});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        backgroundColor: kPrimaryColor,
        leading: Image.asset("assets/images/Doctor.png"),
        trailing: Image.asset(
          "assets/images/yellow right arrow.png",
        ),
        title: customText2(title: "خدمة مستشارك في التخاطب", color: kHomeColor),
        children: [
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              trailing: const SizedBox.shrink(),
              onTap: onTapInductions,
              title: Row(
                children: [
                  Image.asset("assets/images/book.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  customText4(
                      title: KeysConfig.IntroductionService, color: kBlackText),
                ],
              ),
            ),
          ),
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              trailing: const SizedBox.shrink(),
              onTap: onTapAppointmentReservation,
              title: Row(
                children: [
                  Image.asset("assets/images/paper.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  customText4(
                      title: KeysConfig.BookSpecialist, color: kBlackText),
                ],
              ),
            ),
          ),
        ]);
  }
}
