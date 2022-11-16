import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/drawer/page/previous_treatment_sessions/views/drop_down_result_sessions.dart';
import 'package:tal3thoom/screens/home/view.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:video_player/video_player.dart';

import '../../../widgets/appBar.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/mediaButton.dart';
import '../../../widgets/video_items.dart';
import '../../view.dart';
import '../diagnostic_service/page/views/question.dart';
import 'cubit/previous_sessions_cubit.dart';

// ignore: must_be_immutable
class ResultsPreviousTreatmentSessions extends StatefulWidget {
  const ResultsPreviousTreatmentSessions({Key? key}) : super(key: key);

  @override
  State<ResultsPreviousTreatmentSessions> createState() =>
      _ResultsPreviousTreatmentSessionsState();
}

class _ResultsPreviousTreatmentSessionsState
    extends State<ResultsPreviousTreatmentSessions> {
  String? sessionNumber;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PreviousSessionsCubit>(context);

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
        child: SingleChildScrollView(
          child: BlocConsumer<PreviousSessionsCubit, PreviousSessionsState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<PreviousSessionsCubit>(context);

              return Column(children: [
                Center(
                  child: CustomTileContainer(
                      widthh: context.width / 1.5,
                      title: "نتائج الجلسات العلاجية السابقة",
                      context: context),
                ),
                Center(
                    child: customText7(
                        title: "أختر نتيجة الجلسة العلاجية",
                        color: kBlackText)),
                Center(child: DropDownListResultSessions(onChanged: (value) {
                  cubit.onSessionTypeChanged(value);

                  sessionNumber = value;

                  cubit.getPreviousAnswers(sessionNumber: sessionNumber!);
                })),
                if (sessionNumber != null) answerQuestionTitle(
                    title: "القسم الأول : \t", subtitle: "معرفي"),
                if (sessionNumber != null)  answerQuestionTitle(
                    title: "الإجابات الصحيحة مظللة بالون :\t",
                    subtitle: "الأزرق"),

                if (sessionNumber != null) BlocConsumer<PreviousSessionsCubit, PreviousSessionsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is PreviousSessionsLoading) {
                      return const Center(
                        child: LoadingFadingCircle(),
                      );
                    }
                    if (state is PreviousSessionsSuccess) {
                      return Form(
                        key: cubit.formKey,
                        child: SizedBox(
                          height: context.height * 0.4,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.previousAnswersModel.data!
                                .cognitiveResult!.length,
                            itemBuilder: (context, index) {

                              print("meddddddddd ${state.previousAnswersModel.data!.cognitiveResult![index].patientAnswers?.first.toString()}");
                              return Center(
                                child: Column(
                                  children: [
                                    state
                                                .previousAnswersModel
                                                .data!
                                                .cognitiveResult![index]
                                                .question!
                                                .description ==
                                            null
                                        ? const SizedBox.shrink()
                                        : Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 4),
                                                width: context.width * 0.8,
                                                // height: context.height * 0.14,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                      topLeft:
                                                          Radius.circular(8),
                                                    ),
                                                    color: kBackgroundButton),
                                                child: FormBuilder(
                                                  autovalidateMode:
                                                      AutovalidateMode.always,
                                                  child: FormBuilderRadioGroup<
                                                      dynamic>(
                                                    decoration: InputDecoration(


                                                      labelStyle: const TextStyle(color: kBlackText, fontSize: 18, fontFamily: 'DinBold'),
                                                      labelText: "${index + 1} " +
                                                          state.previousAnswersModel.data!.cognitiveResult![index].question!.description!,


                                                    ),

                                                    initialValue: state.previousAnswersModel.data!.cognitiveResult![index].patientAnswers?.first.toString(),
                                                    name: 'best_language',
                                                    options: state.previousAnswersModel.data!.cognitiveResult![index].question!
                                                        .answers!
                                                        .map((lang) =>
                                                            FormBuilderFieldOption(
                                                              value: lang.answerOption,
                                                              child: customText3(title: lang.answerOption.toString(),
                                                                  color: kBlackText),
                                                            ))
                                                        .toList(
                                                            growable: false),
                                                    controlAffinity:
                                                        ControlAffinity
                                                            .trailing,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    state
                                                .previousAnswersModel
                                                .data!
                                                .cognitiveResult![index]
                                                .question!
                                                .videoFile ==
                                            null
                                        ? const SizedBox.shrink()
                                        : Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            width: context.width * 0.8,
                                            height: context.height * 0.25,
                                            child: VideoItems(
                                              videoPlayerController:
                                                  VideoPlayerController.network(
                                                "http://dev-sas.cpt-it.com/api/" +
                                                    state
                                                        .previousAnswersModel
                                                        .data!
                                                        .cognitiveResult![index]
                                                        .question!
                                                        .videoFile!
                                                        .toString(),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                    if (state is PreviousSessionsError) {
                      return Text(state.msg);
                    }
                    return const SizedBox();
                  },
                ),
                if (sessionNumber != null)   answerQuestionTitle(
                    title: "القسم الثاني : \t", subtitle: "سلوكي"),
                if (sessionNumber != null)  answerQuestionTitle(
                    title: "الإجابات الصحيحة مظللة بالون :\t",
                    subtitle: "الأزرق"),
                if (sessionNumber != null)  BlocConsumer<PreviousSessionsCubit, PreviousSessionsState>(
                  listener: (context, state) {},
                  builder: (context, state) {



                    if (state is PreviousSessionsLoading) {
                      return const Center(
                        child: LoadingFadingCircle(),
                      );
                    }
                    if (state is PreviousSessionsSuccess) {



                      return SizedBox(
                        height: context.height * 0.4,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.previousAnswersModel.data!
                              .behavioralResult!.length,
                          itemBuilder: (context, index) {
                            List<String> listOfString = [];
                            dynamic allString = state.previousAnswersModel.data!
                                .behavioralResult![index].question!.hint.toString();
                            listOfString = [allString];
                            listOfString = allString.split(";;");
                            print(
                                "***************************************************************");

                            print(listOfString);


                            print("meddddddddd ${state.previousAnswersModel.data!.behavioralResult![index].patientAnswers?.first.toString()}");
                            return Column(
                              children: [
                                Center(
                                  child:     state.previousAnswersModel.data!.behavioralResult![index].question!.videoFile == null
                                      ? const SizedBox.shrink()
                                      : Container(
                                    margin: const EdgeInsets.symmetric(vertical: 8),
                                    width: context.width * 0.8,
                                    height: context.height * 0.25,
                                    child: VideoItems(
                                      videoPlayerController:
                                      VideoPlayerController.network(
                                        "http://dev-sas.cpt-it.com/api/" +
                                            state.previousAnswersModel.data!.behavioralResult![index].question!.videoFile.toString(),
                                      ),
                                    ),
                                  ),



                                ),

                                state.previousAnswersModel.data!.behavioralResult![index].question!.hint==null ? const SizedBox.shrink():


                                SizedBox(
                                    height: context.height * 0.08,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: listOfString.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                color: kSkyLightColor,

                                                borderRadius: BorderRadius.circular(8)                                ),
                                            margin: const EdgeInsets.symmetric(horizontal:4,),
                                            padding: const EdgeInsets.symmetric(horizontal: 2),
                                            height: context.height * 0.08,

                                            child: Center(
                                              child: customText4(title:listOfString[index] , color: kBlackText),
                                            ),

                                          );
                                        }
                                    )),
                              ],
                            );
                          },
                        ),
                      );
                    }
                    if (state is PreviousSessionsError) {
                      return Text(state.msg);
                    }
                    return const SizedBox();
                  },
                ),




                if (sessionNumber != null)  BlocConsumer<PreviousSessionsCubit, PreviousSessionsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is PreviousSessionsLoading) {
                      return const Center(
                        child: LoadingFadingCircle(),
                      );
                    }
                    if (state is PreviousSessionsSuccess) {
                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              buildColumn(context.height, context.width,
                                  curve: false,
                                  head: "عدد أسئلة القسم المعرفى",
                                  answer: state.previousAnswersModel.data!.conclution!.totalCognitiveQuestions!.toString()),
                              buildColumn(context.height, context.width,
                                  curve: false,
                                  head: "الإجابات الصحيحة",
                                  answer:  state.previousAnswersModel.data!.conclution!.correctCognitiveAnswers.toString()),
                              buildColumnWithImage(context.height, context.width,
                                  head: "عرض الفيديو الخاص بالمريض (القسم السلوكى )",
                                  curve: false,
                                  onTap: () {

                                    showAlertDialogVideo(context, Container(
                                      margin: const EdgeInsets.symmetric(vertical: 8),
                                      width: context.width * 0.8,
                                      height: context.height * 0.25,
                                      child: Card(
                                        child: VideoItems(
                                          videoPlayerController:
                                          VideoPlayerController.network(
                                            "http://dev-sas.cpt-it.com/api/" +
                                                state.previousAnswersModel.data!.conclution!.answerdVideo!.toString(),
                                          ),
                                        ),
                                      ),
                                    ));


                                  }),
                            ],
                          ),
                        ),
                      );
                    }
                    if (state is PreviousSessionsError) {
                      return Text(state.msg);
                    }
                    return const SizedBox();
                  },
                ),
                if (sessionNumber != null)  BlocConsumer<PreviousSessionsCubit, PreviousSessionsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is PreviousSessionsLoading) {
                      return const Center(
                        child: LoadingFadingCircle(),
                      );
                    }
                    if (state is PreviousSessionsSuccess) {
                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  buildColumn(context.height, context.width,
                                      curve: false,
                                      head: "التقيمات",
                                      answer: "تقييم المستوى فى الجلسة الحالية",


                                  ),

                                  buildColumn(context.height, context.width,
                                      curve: false,
                                      head: "تقيم المريض لذاتة",
                                      answer: "${state.previousAnswersModel.data!.currentEvalution!.patientRank!.toInt()}",


                                  ),
                                  buildColumn(context.height, context.width,
                                      curve: false,
                                      head: "تقيم الأخصائي للمريض",
                                      answer: "${state.previousAnswersModel.data!.currentEvalution!.specialistRank!.toInt()}",


                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  buildBoxAnswers(
                                      answers: "التقييم المتوقع للجلسة القادمة"),
                                  buildBoxAnswers(answers: "${state.previousAnswersModel.data!.nextEvalution!.patientRank!.toInt()}"),
                                  buildBoxAnswers(answers: "${state.previousAnswersModel.data!.nextEvalution!.specialistRank!.toInt()}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ) ;
                    }
                    if (state is PreviousSessionsError) {
                      return Text(state.msg);
                    }
                    return const SizedBox();
                  },
                ),





                SizedBox(
                  height: context.height * 0.1,
                )
              ]);
            },
          ),
        ),
      ),
    );
  }

  Widget buildContainerIndex(double width, double height,
      {required int index}) {
    return Container(
      width: width * 0.1,
      height: height * 0.14,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          color: kPrimaryColor),
      child: Center(
        child: customText3(title: "$index", color: kHomeColor),
      ),
    );
  }

  Widget buildBoxAnswers({required String answers}) {
    return Container(
      height: context.height * 0.1,
      width: context.width * 0.3,
      decoration: const BoxDecoration(
          color: kAppBarColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: Center(
        child: customText3(title: answers, color: kBlackText),
      ),
    );
  }

  Widget buildColumnWithImage(double height, double width,
      {required bool curve,
      required String head,
      required VoidCallback onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: context.height * 0.1,
          width: context.width * 0.3,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            // borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft:  Radius.circular(8),)
          ),
          child: Center(
            child: custom12Text(title: head, color: kHomeColor),
          ),
        ),
        Container(
          height: context.height * 0.1,
          width: context.width * 0.3,
          decoration: BoxDecoration(
            color: kAppBarColor,
            borderRadius: curve
                ? const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  )
                : null,
          ),
          child: Center(
            child: InkWell(
              onTap: onTap,
              child: Container(
                  width: context.width * 0.1,
                  height: context.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kButtonGreenDark,
                  ),
                  child: Image.asset("assets/images/eye.png")),
            ),
          ),
        )
      ],
    );
  }

  Widget buildColumn(double height, double width,
      {required bool curve, required String head, required String answer, String? answer2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: context.height * 0.1,
          width: context.width * 0.3,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: curve
                  ? const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    )
                  : null),
          child: Center(
            child: custom12Text(title: head, color: kHomeColor),
          ),
        ),
        Container(
          height: context.height * 0.1,
          width: context.width * 0.3,
          decoration: const BoxDecoration(
              color: kAppBarColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
          child: Center(
            child: customText3(title: answer, color: kBlackText),
          ),
        ),
      ],
    );
  }
  Widget buildColumnWithAnswer(double height, double width,
      {required bool curve, required String head, required String answer, required String answer2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: context.height * 0.1,
          width: context.width * 0.3,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: curve
                  ? const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )
                  : null),
          child: Center(
            child: custom12Text(title: head, color: kHomeColor),
          ),
        ),
        Container(
          height: context.height * 0.1,
          width: context.width * 0.3,
          decoration: const BoxDecoration(
              color: kAppBarColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
          child: Center(
            child: customText3(title: answer, color: kBlackText),
          ),
        ),
        Container(
          height: context.height * 0.1,
          width: context.width * 0.3,
          decoration: const BoxDecoration(
              color: kAppBarColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
          child: Center(
            child: customText3(title: answer2, color: kBlackText),
          ),
        ),
      ],
    );
  }
  Widget answerQuestionTitle(
      {required String title, required String subtitle}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Row(
        children: [
          customText10(title: title, color: kBlackText),
          customText10(title: subtitle, color: kPrimaryColor),
        ],
      ),
    );
  }
}
