import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../home/pages/views/profile/cubit/profile_cubit.dart';
import '../../../../../../../widgets/alerts.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/customButton.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../../widgets/video_items.dart';
import '../../../../../../view.dart';
import '../first_stage_additional_traning/view.dart';
import '../first_treatment_session/cubit/cognitive_section_cubit.dart';
import '../first_treatment_session/view.dart';
import '../sloki/view.dart';

// ignore: must_be_immutable

class NextSession extends StatefulWidget {
  const NextSession({Key? key}) : super(key: key);

  @override
  State<NextSession> createState() => _NextSessionState();
}

class _NextSessionState extends State<NextSession> {
  @override
  Widget build(BuildContext context) {
    final currentStage = Prefs.getString("currentStage");

    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
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
                BlocProvider.of<CognitiveSectionCubit>(context).getCognitiveSection();
                Get.off(()=> const FirstTreatmentSession());
               // ;
              },
            ),
          ],
        ),
      ),
    );
  }
}
