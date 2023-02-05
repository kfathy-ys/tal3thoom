import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/models/diagnostic_payment_model.dart';

import '../../../widgets/constants.dart';
import '../../../../../../config/keys.dart';

// ignore: must_be_immutable
class DiagnosticServices extends StatefulWidget {
  final VoidCallback onTapInductions;
  final VoidCallback onTapPayment;
  final VoidCallback onTapHistory;
  final VoidCallback onTapTestOases;
  final VoidCallback onTapSSRS;
  final VoidCallback onTapSSi;
  final VoidCallback onTapAppointentReservation;

  final Widget isPayment;
  final Widget isCaseHistory;
  final Widget isOases;
  final Widget isSsrs;
  final Widget isSsi4;
  final Widget isDiagnosticReserved;

  const DiagnosticServices({
    super.key,
    required this.onTapInductions,
    required this.onTapPayment,
    required this.onTapHistory,
    required this.onTapTestOases,
    required this.onTapSSRS,
    required this.onTapSSi,
    required this.onTapAppointentReservation,
    required this.isPayment,
    required this.isCaseHistory,
    required this.isOases,
    required this.isSsrs,
    required this.isSsi4,
    required this.isDiagnosticReserved,
  });

  @override
  State<DiagnosticServices> createState() => _DiagnosticServicesState();
}

class _DiagnosticServicesState extends State<DiagnosticServices> {


  @override
  Widget build(BuildContext context) {
    DiagnosticPaymentModel? diagnosticPaymentModel;
   bool _isAvailable = Prefs.getBool("isAvailable");

    double height = MediaQuery.of(context).size.height;

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
              onTap: widget.onTapInductions,
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
              onTap: widget.onTapPayment,
              title: Row(
                children: [
                  Image.asset("assets/images/wallet.png"),
                  buildSizedBox(),
                  _isAvailable == false ? customText4(title: KeysConfig.payment, color: kBlackText): customText4(title :  "متابعة", color: kBlackText),
                ],
              ),
              trailing: widget.isPayment,
            ),
          ),
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              onTap: widget.onTapHistory,
              title: Row(
                children: [
                  Image.asset("assets/images/Today's calendar.png"),
                  buildSizedBox(),
                  customText4(
                      title: KeysConfig.medicalHistory, color: kBlackText),
                ],
              ),
              trailing: widget.isCaseHistory,
            ),
          ),
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              onTap: widget.onTapTestOases,
              title: Row(
                children: [
                  Image.asset("assets/images/square question.png"),
                  buildSizedBox(),
                  customText4(title: KeysConfig.testOases, color: kBlackText),
                ],
              ),
              trailing: widget.isOases,
            ),
          ),
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              onTap: widget.onTapSSRS,
              title: Row(
                children: [
                  Image.asset("assets/images/circular question.png"),
                  buildSizedBox(),
                  customText4(title: KeysConfig.testSSRS, color: kBlackText),
                ],
              ),
              trailing: widget.isSsrs,
            ),
          ),
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
                onTap: widget.onTapSSi,
                title: Row(
                  children: [
                    Image.asset("assets/images/paper.png"),
                    buildSizedBox(),
                    customText4(title: KeysConfig.test4, color: kBlackText),
                  ],
                ),
                trailing: widget.isSsi4),
          ),
          Container(
            height: context.height * 0.08,
            decoration: const BoxDecoration(
                color: kRoundBorderColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: ListTile(
              onTap: widget.onTapAppointentReservation,
              title: Row(
                children: [
                  Image.asset("assets/images/addition.png"),
                  buildSizedBox(),
                  customText4(
                      title: KeysConfig.BookSpecialist, color: kBlackText),
                ],
              ),
              trailing: widget.isDiagnosticReserved,
            ),
          ),
        ]);
  }

  SizedBox buildSizedBox() => const SizedBox(
        width: 10,
      );
}
