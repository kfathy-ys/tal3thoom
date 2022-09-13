import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/constants.dart';
import '../../../../../../config/keys.dart';

// ignore: must_be_immutable
class DiagnosticServices extends StatelessWidget {
  final VoidCallback onTapInductions;
  final VoidCallback onTapPayment;
  final VoidCallback onTapHistory;
  final VoidCallback onTapTestOases;
  final VoidCallback onTapSSRS;
  final VoidCallback onTapSSi;
  final VoidCallback onTapAppointentReservation;

  const DiagnosticServices({
    required this.onTapInductions,
    required this.onTapPayment,
    required this.onTapHistory,
    required this.onTapTestOases,
    required this.onTapSSRS,
    required this.onTapSSi,
    required this.onTapAppointentReservation,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return ExpansionTile(
        backgroundColor: kPrimaryColor,
        leading: Image.asset("assets/images/stethoscope.png"),
        trailing: Image.asset(
          "assets/images/yellow right arrow.png",
        ),
        title:
            customText2(title: KeysConfig.diagnosticService, color: kHomeColor),
        children: [
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              onTap: onTapInductions,
              title: Row(
                children: [
                  Image.asset("assets/images/book.png"),
                  buildSizedBox(),
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
              onTap: onTapPayment,
              title: Row(
                children: [
                  Image.asset("assets/images/wallet.png"),
                  buildSizedBox(),
                  customText4(title: KeysConfig.payment, color: kBlackText),
                ],
              ),
            ),
          ),
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              onTap: onTapHistory,
              title: Row(
                children: [
                  Image.asset("assets/images/Today's calendar.png"),
                  buildSizedBox(),
                  customText4(
                      title: KeysConfig.medicalHistory, color: kBlackText),
                ],
              ),
            ),
          ),
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              onTap: onTapTestOases,
              title: Row(
                children: [
                  Image.asset("assets/images/square question.png"),
                  buildSizedBox(),
                  customText4(title: KeysConfig.testOases, color: kBlackText),
                ],
              ),
            ),
          ),
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              onTap: onTapSSRS,
              title: Row(
                children: [
                  Image.asset("assets/images/circular question.png"),
                  buildSizedBox(),
                  customText4(title: KeysConfig.testSSRS, color: kBlackText),
                ],
              ),
            ),
          ),
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              onTap: onTapSSi,
              title: Row(
                children: [
                  Image.asset("assets/images/paper.png"),
                  buildSizedBox(),
                  customText4(title: KeysConfig.test4, color: kBlackText),
                ],
              ),
            ),
          ),
          Container(
            height: context.height * 0.08,
            decoration: const BoxDecoration(
                color: kRoundBorderColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: ListTile(
              onTap: onTapAppointentReservation,
              title: Row(
                children: [
                  Image.asset("assets/images/addition.png"),
                  buildSizedBox(),
                  customText4(
                      title: KeysConfig.BookSpecialist, color: kBlackText),
                ],
              ),
            ),
          ),
        ]);
  }

  SizedBox buildSizedBox() => const SizedBox(
        width: 10,
      );
}
