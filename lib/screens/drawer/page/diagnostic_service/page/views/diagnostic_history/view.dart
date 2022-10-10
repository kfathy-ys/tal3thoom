import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/cubit/diagnostic_history_question_cubit.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/success_page.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../config/keys.dart';
import '../../../../../../widgets/alerts.dart';
import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../view.dart';
import '../diagnostci_oases_test/view.dart';
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
            // customText9(
            //   //// TODO::: todo 5 varaibles to store length for every qlist
            //   color: kPrimaryColor,
            //   title:  " (${cubit.index} من ${qList.length})",
            //
            // ),
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
                      onChanged: () {},
                      autoFocusOnValidationFailure: true,
                      autovalidateMode: AutovalidateMode.always,
                      child: FormBuilderRadioGroup<Answers>(
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () => speech.speak(currentQuestion
                                      .description
                                      .toString() +
                                  "الاجابات المتاحة هي "
                                      '${currentQuestion.answers.map((lang) => lang.answerOption)}'),
                              child: Image.asset("assets/images/Earphone.png")),
                          suffix: cubit.shouldShowTextField(currentQuestion)
                              ? SizedBox(
                                  height: 60,
                                  width: 150,
                                  child: TextFormField(
                                    // onSaved:(String? str) =>
                                    // cubit.answersTxt[currentQuestion] = str! ,
                                    controller: TextEditingController(
                                        text:
                                            cubit.answersTxt[currentQuestion]),

                                    onChanged: (str) =>
                                        cubit.answersTxt[currentQuestion] = str,
                                  ))
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
                        validator: (value) {
                          if (value == null) {
                            return 'من فضلك أجب علي المدون أعلاة ';
                          }
                          return '';
                        },
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
    return Scaffold(
        backgroundColor: kHomeColor,
        drawer: const MenuItems(),
        appBar: DynamicAppbar(
            context: context,
            press: (context) => Scaffold.of(context).openDrawer()),
        body: SingleChildScrollView(
          child: Container(
            height: context.height,
            width: context.width,
            color: kHomeColor,
            child: BlocConsumer<DiagnosticHistoryQuestionCubit,
                DiagnosticHistoryQuestionState>(
              listener: (context, state) {
                if(  state is DiagnosticHistoryQuestionError){
                  Alert.error("الرجاء التحقق من الإجابات الممكنة والمدونة بالأسفل",desc: " حقل إجابات المريض مطلوب ، ولا يمكن أن يكون خاليًا أو فارغًا ");
                }
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
                  return Form(
                    key: cubit.formKey,
                    child: SingleChildScrollView(
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
                              "assets/images/255.png",
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
                                    }

                                    ,
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
                  return Text(state.msg);
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
