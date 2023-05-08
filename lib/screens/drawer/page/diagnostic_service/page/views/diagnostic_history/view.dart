import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:queen/validation.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/cubit/diagnostic_history_question_cubit.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../config/keys.dart';
import '../../../../../../widgets/alerts.dart';
import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/custom_text_filed_history_numbers.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../view.dart';
import 'models/diagnostic_history_question_model.dart';

// ignore: must_be_immutable
class DiagnosticHistory extends StatefulWidget {
  const DiagnosticHistory({Key? key}) : super(key: key);

  @override
  State<DiagnosticHistory> createState() => _DiagnosticHistoryState();
}

class _DiagnosticHistoryState extends State<DiagnosticHistory> {
  /// Build 6 Of Categories To Describe The Content
  Widget buildCategoryItem(int number) {
    print('number is $number');
    final cubit = BlocProvider.of<DiagnosticHistoryQuestionCubit>(context);
    final categoryNumber = number + 2;
    final qList = cubit.questionList
        .where((e) => e.categoryId == categoryNumber)
        .toList();

    /// Build Main Widget To Expanded The Content
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        collapsedBackgroundColor: kSky2Button,
        iconColor: kPrimaryColor,
        // childrenPadding: const EdgeInsets.symmetric(horizontal: 14),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            customBoldText(
                title: KeysConfig.qNames[number], color: kPrimaryColor),
          ],
        ),
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: qList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final currentQuestion = qList[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      currentQuestion.description.toString(),
                      style: const TextStyle(
                          color: kBlackText,
                          fontSize: 14,
                          fontFamily: 'DinBold'),
                      maxLines: 2,
                    ),
                    FormBuilder(

                      autoFocusOnValidationFailure: true,
                      autovalidateMode: AutovalidateMode.always,
                      child: FormBuilderRadioGroup<Answers>(

                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () async {
                                if (await Permission.microphone
                                    .request()
                                    .isGranted) {
                                  speech.speak(currentQuestion.description
                                          .toString() +
                                      "الاجابات المتاحة هي "
                                          '${currentQuestion.answers.map((lang) => lang.answerOption)}');
                                } else {
                                  Alert.error(
                                      "يجب الحصول علي تصريح الوصول الي الميكروفون");
                                }
                              },
                              child: Image.asset("assets/images/Earphone.png")),
                          suffix: cubit.shouldShowTextField(currentQuestion)
                              ? CustomTextFieldHistory(


                                  controller: TextEditingController(
                                      text: cubit
                                          .answersTxt[currentQuestion]),
                                // textInputFormatter: [
                                //   FilteringTextInputFormatter.deny(
                                //       RegExp(r'[^A-Za-z0-9]+')),
                                // ],

                                  onsave: (str) {
                                    cubit
                                      .answersTxt[currentQuestion] = str;
                                    print(str);
                                  },

                                  // type: currentQuestion.description.toString()
                                  //         .contains("-")
                                  //     ? TextInputType.number
                                  //     : TextInputType.text ,

                                   validator: qValidator([
                                     IsRequired(KeysConfig.thisFieldRequired),
                                     MinLength(1),
                                     MaxLength(40),
                                   ]),



                          )
                              : null,
                        ),

                        initialValue: cubit.answer[currentQuestion],
                        name: 'best_language',
                        onChanged: (value) {
                          log('$value');
                          if (value != null) {
                            setState(() {
                              cubit.answer[currentQuestion] = value;
                            });
                          }

                          /// Increment Header Index
                          if (currentQuestion.isAnswred == false) {
                            setState(() {
                              currentQuestion.isAnswred = true;
                              cubit.index++;
                            });
                          }
                        },

                        //TODO:: The Client Want To Disable the Validation In All Fields
                        // validator: (value) {
                        //   if (value == null) {
                        //     return 'من فضلك أجب علي المدون أعلاة ';
                        //   }
                        //   return '';
                        // },
                        options: currentQuestion.answers
                            .map((lang) => FormBuilderFieldOption(
                                  value: lang,
                                  child: customText3(
                                      title: lang.answerOption.toString(),
                                      color: kBlackText),
                                ))
                            .toList(growable: false),
                        controlAffinity: ControlAffinity.trailing,
                      ),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<DiagnosticHistoryQuestionCubit>(context)
    //     .getDiagnosticHistoryQuestion();
    return Scaffold(
        backgroundColor: kHomeColor,
        drawer: const MenuItems(),
        appBar: DynamicAppbar(
            context: context,
            press: (context) => Scaffold.of(context).openDrawer()),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

          child: Container(
            height: context.height,
            width: context.width,
            color: kHomeColor,
            child: BlocConsumer<DiagnosticHistoryQuestionCubit,
                DiagnosticHistoryQuestionState>(
              listener: (context, state) {

              },
              builder: (context, state) {
                final cubit =
                    BlocProvider.of<DiagnosticHistoryQuestionCubit>(context);
                if (state is DiagnosticHistoryQuestionLoading) {
                  return const Center(
                    child: LoadingFadingCubeGrid(),
                  );
                }
                if (state is DiagnosticHistoryQuestionSuccess) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

                    child: Form(
                      key: cubit.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTile(
                                    widthh: context.width * 0.5,
                                    title: KeysConfig.medicalHistory,
                                    context: context),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Center(
                                  child: customBoldText(
                                      title: KeysConfig.firstTest,
                                      color: kBlackText)),
                            ),
                            Image.asset(
                              "assets/images/test 10.png",
                            ),
                            buildSizedBoxed(context.height),
                            ...List.generate(6, buildCategoryItem).toList(),
                            buildSizedBoxed(context.height),
                            state is! DiagnosticHistoryQuestionLoading
                                ? MediaButton(
                                    onPressed: () {
                                      if (cubit.formKey.currentState!
                                          .validate()) {
                                        cubit.postDiagnosticHistoryAnswers();
                                      }
                                      // Alert.error("الرجاء التحقق من الإجابات الممكنة والمدونة بالأسفل",desc: " حقل إجابات المريض مطلوب ، ولا يمكن أن يكون خاليًا أو فارغًا ");
                                      // Get.to(()=>const DiagnosticHistory());
                                    },
                                    title: KeysConfig.next,
                                  )
                                : const LoadingFadingCircle(),
                            SizedBox(
                              height: context.height * 0.2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                if (state is DiagnosticHistoryQuestionError) {
                  BlocProvider.of<DiagnosticHistoryQuestionCubit>(context)
                      .getDiagnosticHistoryQuestion();


                }
                return const SizedBox();
              },
            ),
          ),
        ));
  }

  SizedBox buildSizedBoxed(double height) => SizedBox(
        height: context.height * 0.025,
      );
}
