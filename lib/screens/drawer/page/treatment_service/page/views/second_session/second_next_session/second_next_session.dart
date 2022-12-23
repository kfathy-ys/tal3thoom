import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/customButton.dart';
import '../../first_session/first_stage_additional_traning/view.dart';
import '../second_cognitive_session/cubit/second_cognitive_section_cubit.dart';
import '../second_cognitive_session/view.dart';

// ignore: must_be_immutable

class SecondNextSession extends StatefulWidget {
  const SecondNextSession({Key? key}) : super(key: key);

  @override
  State<SecondNextSession> createState() => _SecondNextSessionState();
}

class _SecondNextSessionState extends State<SecondNextSession> {
  @override
  Widget build(BuildContext context) {
    final currentStage = Prefs.getString("currentStage");

    return Scaffold(
      backgroundColor: kHomeColor,
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: context.height,
        width: context.width,
        color: kHomeColor,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          children: [
            SizedBox(
              height: context.height * 0.2,
            ),
            customText4(
                title:
                    "لقد اتممت الجلسة العلاجية وسيتم تحويلك إلي الجلسة التالية عن طريق المختص بعد تقييمة لنتائج الجلسة والفيديو التي قمت بارسالة",
                color: kBlackText),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: kSkyLightColor,
              width: context.width * 0.85,
              height: context.height * 0.28,
              child: Center(
                child: Image.asset("assets/images/success.png"),
              ),
            ),
            CustomButton(
              title: "تتدريب وتعليم اضافي",
              onPressed: () =>
                  Get.off(() => const FirstStageAdditionalTrainingScreen()),
            ),
            CustomButton(
              title: "الإنتقال إلي المرحلة التالية",
              onPressed: () {
                BlocProvider.of<SecondCognitiveSectionCubit>(context)
                    .getSecondCognitiveSection();
                Get.off(() => const SecondTreatmentSession());
                // ;
              },
            ),
          ],
        ),
      ),
    );
  }
}
