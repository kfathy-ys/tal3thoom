import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/better_video_widget.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/customButton.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../../widgets/success_widget.dart';
import '../../../../../../../widgets/sucess_widget_treatment_tests.dart';
import '../../../../../../view.dart';
import '../first_stage_additional_traning/view.dart';
import '../first_stage_oases_test/view.dart';
import '../sloki/cubit/behavioral_cubit.dart';
import 'cubit/cognitive_section_cubit.dart';

// ignore: must_be_immutable

class FirstTreatmentSession extends StatefulWidget {
  const FirstTreatmentSession({Key? key}) : super(key: key);

  @override
  State<FirstTreatmentSession> createState() => _FirstTreatmentSessionState();
}

class _FirstTreatmentSessionState extends State<FirstTreatmentSession> {
  final currentStage = Prefs.getString("currentStage");
  final currentDiagnosesStatus = Prefs.getString("currentDiagnosesStatus");
  final FijkPlayer player = FijkPlayer();

  @override
  void dispose() {
    super.dispose();

    player.release();
  }

  @override
  Widget build(BuildContext context) {
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
        child: BlocConsumer<CognitiveSectionCubit, CognitiveSectionState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<CognitiveSectionCubit>(context);
            if (state is CognitiveSectionLoading) {
              return const Center(
                child: LoadingFadingCircle(),
              );
            }
            if (state is CognitiveSectionSuccess) {
              return Form(
                key: cubit.formKey,
                child: state.questionModel[0].evalType.toString() == "1"
                    ? SuccessViewWidget(
                        title1:
                            "لقد اتممت الجلسة العلاجية وسيتم تحويلك إلي الجلسة التالية عن طريق المختص بعد تقييمة لنتائج الجلسة والفيديو التي قمت بارسالة",
                        title2: "تدريب وتعليم إضافي",
                        onTap: () => Get.offAll(
                            () => const FirstStageAdditionalTrainingScreen()),
                        goNext: true,
                        title3: "الجلسة العلاجية التالية",
                        onTap2: () {
                          BlocProvider.of<CognitiveSectionCubit>(context)
                              .getCognitiveSection();

                          Get.offAll(() => const FirstTreatmentSession());
                        },
                      )
                    : (state.questionModel[0].examMode.toString() ==
                                "jump_oases_1" &&
                            state.questionModel[0].evalType.toString() != "1")
                        ? SuccessViewJumpTest(
                            title1:
                                "لقد اتممت الجلسة العلاجية وسيتم تحويلك إلي الجلسة التالية عن طريق المختص بعد تقييمة لنتائج الجلسة والفيديو التي قمت بارسالة",
                            title2: "الإنتقال إلي إختبار ال Oases",
                            onTap: () =>
                                Get.offAll(() => const FirstStageOasesTest()),
                          )
                        : SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomTileContainer(
                                      widthh: context.width / 1.7,
                                      title: "الجلسة العلاجية " +
                                          state.questionModel[0].tags
                                              .toString(),
                                      context: context),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 4),
                                    child: Image.asset(
                                      "assets/images/marfi.png",
                                    ),
                                  ),
                                  ListView.builder(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: state.questionModel.length,
                                    itemBuilder: (context, index) {
                                      return Center(
                                        child: Column(
                                          children: [
                                            state.questionModel[index]
                                                    .description.isEmpty
                                                ? const SizedBox.shrink()
                                                : Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            vertical: 4),
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 6,
                                                                vertical: 4),
                                                        width:
                                                            context.width * 0.8,
                                                        // height: context.height * 0.14,
                                                        decoration:
                                                            const BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8),
                                                                ),
                                                                color:
                                                                    kBackgroundButton),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [

                                                            AutoSizeText(
                                                        "$index - " +
                                                        state
                                                            .questionModel[
                                                        index]
                                                            .description,
                                                              style: const TextStyle(
                                                                  color: kBlackText,
                                                                  fontSize: 14,
                                                                  fontFamily: 'DinBold'),
                                                              maxLines: 2,
                                                            ),
                                                            FormBuilder(
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .always,
                                                              child:
                                                                  FormBuilderRadioGroup<
                                                                      dynamic>(
                                                                decoration:
                                                                    const InputDecoration(
                                                                  labelStyle: TextStyle(
                                                                      color:
                                                                          kBlackText,
                                                                      fontSize: 18,
                                                                      fontFamily:
                                                                          'DinBold'),
                                                                  // labelText: "${index + 1} " +
                                                                  //     state
                                                                  //         .questionModel[
                                                                  //             index]
                                                                  //         .description,
                                                                ),
                                                                initialValue: cubit
                                                                    .answer[state
                                                                        .questionModel[
                                                                    index]],
                                                                name:
                                                                    'best_language',
                                                                onChanged: (value) {
                                                                  log('$value');
                                                                  if (value !=
                                                                      null) {
                                                                    setState(() {
                                                                      cubit
                                                                          .answer[state
                                                                              .questionModel[
                                                                          index]] = value;
                                                                    });
                                                                  }
                                                                },
                                                                validator: (value) {
                                                                  if (value ==
                                                                      null) {
                                                                    return 'من فضلك أجب علي المدون أعلاة ';
                                                                  }
                                                                  return '';
                                                                },
                                                                options: state
                                                                    .questionModel[
                                                                        index]
                                                                    .answers
                                                                    .map((lang) =>
                                                                        FormBuilderFieldOption(
                                                                          value:
                                                                              lang,
                                                                          child: customText3(
                                                                              title: lang
                                                                                  .answerOption
                                                                                  .toString(),
                                                                              color:
                                                                                  kBlackText),
                                                                        ))
                                                                    .toList(
                                                                        growable:
                                                                            false),
                                                                controlAffinity:
                                                                    ControlAffinity
                                                                        .trailing,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            state.questionModel[index]
                                                        .videoFile ==
                                                    null
                                                ? const SizedBox.shrink()
                                                : Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 8),
                                                    width: context.width * 0.8,
                                                    height:
                                                        context.height * 0.25,
                                                    child:



                                                        VideoScreen(
                                                      url: "http://mcsc-saudi.com/api/" +
                                                          state
                                                              .questionModel[
                                                                  index]
                                                              .videoFile
                                                              .toString(),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  CustomButton(
                                    color: kPrimaryColor,
                                    title: "متابعة",
                                    onPressed: () {
                                      if (cubit.formKey.currentState!
                                          .validate()) {
                                        BlocProvider.of<BehavioralCubit>(
                                                context)
                                            .getBehavioralSection();

                                        cubit.sendCognitiveSectionAnswers();
                                      }
                                      // navigateTo(context, const SlokiScreen());
                                    },
                                  ),
                                ]),
                          ),
              );
            }
            if (state is CognitiveSectionError) {
              return Text(state.msg);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
