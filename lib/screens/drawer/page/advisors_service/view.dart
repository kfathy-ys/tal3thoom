import 'package:flutter/material.dart';

import '../../../widgets/constants.dart';
import '../../../../../../config/keys.dart';

// ignore: must_be_immutable
class AdvisorsService extends StatelessWidget {
  final VoidCallback onTapInductions;

  final VoidCallback onTapAppointentReservation;

  const AdvisorsService({
    required this.onTapInductions,
    required this.onTapAppointentReservation,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return ExpansionTile(
        backgroundColor: kPrimaryColor,
        leading: Image.asset("assets/images/Doctor.png"),
        trailing: Image.asset(
          "assets/images/yellow right arrow.png",
        ),
        title: customText2(
            title: KeysConfig.advisoriesService , color: kHomeColor),
        children: [
          Container(
            height: height * 0.08,
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
                      title: KeysConfig.IntroductionService ,
                      color: kBlackText),
                ],
              ),
            ),
          ),
          Container(
            height: height * 0.08,
            color: kRoundBorderColor,
            child: ListTile(
              trailing: const SizedBox.shrink(),
              onTap: onTapAppointentReservation,
              title: Row(
                children: [
          Image.asset("assets/images/paper.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  customText4(
                      title: KeysConfig.BookSpecialist , color: kBlackText),
                ],
              ),
            ),
          ),
        ]);
  }
}
