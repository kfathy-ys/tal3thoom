import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../config/keys.dart';

import '../../../../../../widgets/constants.dart';

// ignore: must_be_immutable
class TreatmentServiceExpansion extends StatelessWidget {
  final VoidCallback onTapInductions;
  final VoidCallback onTapPayment;
  final VoidCallback PretreatmentQuestionnaire;

  final VoidCallback onTaptherapeuticSessions;
  final VoidCallback onTapOases;
  final VoidCallback onTapSSRS;
  final VoidCallback onTapSSI4;
  final VoidCallback onTapBookSpecialist;
  final VoidCallback onTaptherapeuticSessions2;
  final VoidCallback onTapOases2;
  final VoidCallback onTapSSRS2;
  final VoidCallback onTapSSI42;
  final VoidCallback onTapBookSpecialist2;
  final Widget isPayment;
  final Widget isQuestionnaire;
  final Widget isFirstSessions;
  final Widget isOases;
  final Widget isSsrs;
  final Widget isSsi4;
  final Widget isReservedFirst;
  final Widget isSessionTwo;
  final Widget isOasesTwo;
  final Widget isSsrsTwo;
  final Widget isSsi4Two;
  final Widget isReservedTwo;

  const TreatmentServiceExpansion({
    super.key,
    required this.onTapInductions,
    required this.onTapPayment,
    required this.PretreatmentQuestionnaire,
    required this.onTapSSRS,
    required this.onTaptherapeuticSessions,
    required this.onTapOases,
    required this.onTapSSI4,
    required this.onTapBookSpecialist,
    required this.onTaptherapeuticSessions2,
    required this.onTapOases2,
    required this.onTapSSRS2,
    required this.onTapSSI42,
    required this.onTapBookSpecialist2,
    required this.isPayment,
    required this.isQuestionnaire,
    required this.isFirstSessions,
    required this.isOases,
    required this.isSsrs,
    required this.isSsi4,
    required this.isReservedFirst,
    required this.isSessionTwo,
    required this.isOasesTwo,
    required this.isSsrsTwo,
    required this.isSsi4Two,
    required this.isReservedTwo,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    bool _isAvailable = Prefs.getBool("isAvailable");

    // double width = MediaQuery.of(context).size.width;
    return ExpansionTile(
        backgroundColor: kPrimaryColor,
        leading: Image.asset("assets/images/treatment.png"),
        trailing: Image.asset(
          "assets/images/yellow right arrow.png",
        ),
        title:
            customText2(title: KeysConfig.treatmentService, color: kHomeColor),
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
                  _isAvailable == false ? customText4(title: KeysConfig.payment, color: kBlackText): customText4(title :  "متابعة", color: kBlackText),
                ],
              ),
              trailing: isPayment,
            ),
          ),
          Container(
            height: context.height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              onTap: PretreatmentQuestionnaire,
              title: Row(
                children: [
                  Image.asset("assets/images/paper.png"),
                  buildSizedBox(),
                  customText4(
                      title: KeysConfig.PretreatmentQuestionnaire,
                      color: kBlackText),
                ],
              ),
              trailing: isQuestionnaire,
            ),
          ),
          Container(
            color: kRoundBorderColor,
            child: ExpansionTile(
              trailing: Image.asset(
                "assets/images/yellow right arrow.png",
              ),
              title: Row(
                children: [
                  Image.asset("assets/images/1 . treatment.png"),
                  buildSizedBox(),
                  customText4(title: KeysConfig.first, color: kBlackText),
                ],
              ),
              children: [
                Container(
                  height: context.height * 0.08,
                  color: kSkyLightsColor.withOpacity(0.2),
                  child: ListTile(
                    onTap: onTaptherapeuticSessions,
                    title: Row(
                      children: [
                        Image.asset("assets/images/Documents.png"),
                        buildSizedBox(),
                        customText4(
                            title: KeysConfig.therapeuticSessions,
                            color: kBlackText),
                      ],
                    ),
                    trailing: isFirstSessions,
                  ),
                ),
                Container(
                  height: context.height * 0.08,
                  color: kSkyLightsColor.withOpacity(0.2),
                  child: ListTile(
                    onTap: onTapOases,
                    title: Row(
                      children: [
                        Image.asset("assets/images/square question.png"),
                        buildSizedBox(),
                        customText4(
                            title: KeysConfig.testOases, color: kBlackText),
                      ],
                    ),
                    trailing: isOases,
                  ),
                ),
                Container(
                  color: kSkyLightsColor.withOpacity(0.2),
                  height: context.height * 0.08,
                  child: ListTile(
                    onTap: onTapSSRS,
                    title: Row(
                      children: [
                        Image.asset("assets/images/circular question.png"),
                        buildSizedBox(),
                        customText4(
                            title: KeysConfig.testSSRS, color: kBlackText),
                      ],
                    ),
                    trailing: isSsrs,
                  ),
                ),
                Container(
                  color: kSkyLightsColor.withOpacity(0.2),
                  height: context.height * 0.08,
                  child: ListTile(
                    onTap: onTapSSI4,
                    title: Row(
                      children: [
                        Image.asset("assets/images/paper.png"),
                        buildSizedBox(),
                        customText4(title: KeysConfig.test4, color: kBlackText),
                      ],
                    ),
                    trailing: isSsi4,
                  ),
                ),
                Container(
                  height: context.height * 0.08,
                  color: kSkyLightsColor.withOpacity(0.2),
                  child: ListTile(
                    onTap: onTapBookSpecialist,
                    title: Row(
                      children: [
                        Image.asset("assets/images/addition.png"),
                        buildSizedBox(),
                        customText4(
                            title: KeysConfig.BookSpecialist,
                            color: kBlackText),
                      ],
                    ),
                    trailing: isReservedFirst,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kRoundBorderColor,
            child: ExpansionTile(
              trailing: Image.asset(
                "assets/images/yellow right arrow.png",
              ),
              title: Row(
                children: [
                  Image.asset("assets/images/2 . treatment.png"),
                  buildSizedBox(),
                  customText4(title: KeysConfig.second, color: kBlackText),
                ],
              ),
              children: [
                Container(
                  height: context.height * 0.08,
                  color: kSkyLightsColor.withOpacity(0.2),
                  child: ListTile(
                    onTap: onTaptherapeuticSessions2,
                    title: Row(
                      children: [
                        Image.asset("assets/images/Documents.png"),
                        buildSizedBox(),
                        customText4(
                            title: KeysConfig.therapeuticSessions,
                            color: kBlackText),
                      ],
                    ),
                    trailing: isSessionTwo,
                  ),
                ),
                Container(
                  height: context.height * 0.08,
                  color: kSkyLightsColor.withOpacity(0.2),
                  child: ListTile(
                    onTap: onTapOases2,
                    title: Row(
                      children: [
                        Image.asset("assets/images/square question.png"),
                        buildSizedBox(),
                        customText4(
                            title: KeysConfig.testOases, color: kBlackText),
                      ],
                    ),
                    trailing: isOasesTwo,
                  ),
                ),
                Container(
                  color: kSkyLightsColor.withOpacity(0.2),
                  height: context.height * 0.08,
                  child: ListTile(
                    onTap: onTapSSRS2,
                    title: Row(
                      children: [
                        Image.asset("assets/images/circular question.png"),
                        buildSizedBox(),
                        customText4(
                            title: KeysConfig.testSSRS, color: kBlackText),
                      ],
                    ),
                    trailing: isSsrsTwo,
                  ),
                ),
                Container(
                  color: kSkyLightsColor.withOpacity(0.2),
                  height: context.height * 0.08,
                  child: ListTile(
                    onTap: onTapSSI42,
                    title: Row(
                      children: [
                        Image.asset("assets/images/paper.png"),
                        buildSizedBox(),
                        customText4(title: KeysConfig.test4, color: kBlackText),
                      ],
                    ),
                    trailing: isSsi4Two,
                  ),
                ),
                Container(
                  height: context.height * 0.08,
                  color: kSkyLightsColor.withOpacity(0.2),
                  child: ListTile(
                    onTap: onTapBookSpecialist2,
                    title: Row(
                      children: [
                        Image.asset("assets/images/addition.png"),
                        buildSizedBox(),
                        customText4(
                            title: KeysConfig.BookSpecialist,
                            color: kBlackText),
                      ],
                    ),
                    trailing: isReservedTwo,
                  ),
                ),
              ],
            ),
          ),
        ]);
  }

  SizedBox buildSizedBox() => const SizedBox(
        width: 10,
      );
}
