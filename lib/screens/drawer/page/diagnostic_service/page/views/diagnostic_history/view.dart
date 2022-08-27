import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/cubit/diagnostic_history_question_cubit.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/success_page.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../config/keys.dart';
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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: kHomeColor,
        drawer: const MenuItems(),
        appBar: DynamicAppbar(
            context: context,
            press: (context) => Scaffold.of(context).openDrawer()),
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            color: kHomeColor,
            child: BlocConsumer<DiagnosticHistoryQuestionCubit,
                DiagnosticHistoryQuestionState>(
              listener: (context, state) {},
              builder: (context, state) {
                final cubit =
                    BlocProvider.of<DiagnosticHistoryQuestionCubit>(context);

                if (state is DiagnosticHistoryQuestionLoading) {
                  return const Center(
                    child: LoadingFadingCubeGrid(),
                  );
                }
                if (state is DiagnosticHistoryQuestionSuccess) {
                  return ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTile(
                              widthh: width * 0.5,
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
                      buildSizedBoxed(height),
                      ExpansionTile(
                        collapsedBackgroundColor: kSky2Button,
                        iconColor: kPrimaryColor,
                        childrenPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        title: customBoldText(
                            title: KeysConfig.informationEdu,
                            color: kPrimaryColor),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.listOfCategoryTwo.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return FormBuilder(
                                  onChanged: () {
                                    // _formKey.currentState!.save();
                                    // debugPrint(_formKey.currentState!.value.toString());
                                  },
                                  autovalidateMode: AutovalidateMode.always,
                                  child: FormBuilderRadioGroup<Answers>(
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: kBlackText,
                                          fontSize: 18,
                                          fontFamily: 'DinBold'),
                                      labelText: cubit.listOfCategoryTwo[index]
                                          .question!.description
                                          .toString(),
                                      suffixIcon: InkWell(
                                          onTap: () => speech.speak(cubit
                                                  .listOfCategoryTwo[index]
                                                  .question!
                                                  .description
                                                  .toString() +
                                              '${cubit.listOfCategoryTwo[index].question!.answers!.map((lang) => lang.answerOption)}'),
                                          child: Image.asset(
                                              "assets/images/Earphone.png")),
                                      suffix: cubit.shouldShowTextField(
                                              questionId: cubit
                                                  .listOfCategoryTwo[index]
                                                  .question!
                                                  .id!)
                                          ? SizedBox(
                                              height: 60,
                                              width: 150,
                                              child: TextFormField())
                                          : null,
                                    ),

                                    initialValue: null,
                                    name: 'best_language',
                                    onChanged: (value) {
                                      log('$value');
                                      if (value != null) {
                                        setState(() {
                                          cubit.answer[cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!] = value;
                                        });
                                      }


                                    },
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'من فضلك أجب علي هذا السؤال';
                                    //   }
                                    //   return 'تمام';
                                    // },
                                    options: cubit.listOfCategoryTwo[index]
                                        .question!.answers!
                                        .map((lang) => FormBuilderFieldOption(
                                              value: lang,
                                              child: customText3(
                                                  title: lang.answerOption
                                                      .toString(),
                                                  color: kBlackText),
                                            ))
                                        .toList(growable: false),
                                    controlAffinity: ControlAffinity.trailing,
                                  ),
                                );
                              })
                        ],
                      ),
                      buildSizedBoxed(height),
                      ExpansionTile(
                        collapsedBackgroundColor: kSky2Button,
                        iconColor: kPrimaryColor,
                        childrenPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        title: customBoldText(
                            title: "تاريخ الامراض السابقة ",
                            color: kPrimaryColor),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.listOfCategoryTwo.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return FormBuilder(
                                  onChanged: () {
                                    // _formKey.currentState!.save();
                                    // debugPrint(_formKey.currentState!.value.toString());
                                  },
                                  autovalidateMode: AutovalidateMode.always,
                                  child: FormBuilderRadioGroup<Answers>(
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: kBlackText,
                                          fontSize: 18,
                                          fontFamily: 'DinBold'),
                                      labelText: cubit.listOfCategoryTwo[index]
                                          .question!.description
                                          .toString(),
                                      suffixIcon: InkWell(
                                          onTap: () => speech.speak(cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .description
                                              .toString() +
                                              '${cubit.listOfCategoryTwo[index].question!.answers!.map((lang) => lang.answerOption)}'),
                                          child: Image.asset(
                                              "assets/images/Earphone.png")),
                                      suffix: cubit.shouldShowTextField(
                                          questionId: cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!)
                                          ? SizedBox(
                                          height: 60,
                                          width: 150,
                                          child: TextFormField())
                                          : null,
                                    ),

                                    initialValue: null,
                                    name: 'best_language',
                                    onChanged: (value) {
                                      log('$value');
                                      if (value != null) {
                                        setState(() {
                                          cubit.answer[cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!] = value;
                                        });
                                      }


                                    },
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'من فضلك أجب علي هذا السؤال';
                                    //   }
                                    //   return 'تمام';
                                    // },
                                    options: cubit.listOfCategoryTwo[index]
                                        .question!.answers!
                                        .map((lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: customText3(
                                          title: lang.answerOption
                                              .toString(),
                                          color: kBlackText),
                                    ))
                                        .toList(growable: false),
                                    controlAffinity: ControlAffinity.trailing,
                                  ),
                                );
                              })
                        ],
                      ),
                      buildSizedBoxed(height),
                      ExpansionTile(
                        collapsedBackgroundColor: kSky2Button,
                        iconColor: kPrimaryColor,
                        childrenPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        title: customBoldText(
                            title: "تاريخ التأتأة", color: kPrimaryColor),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.listOfCategoryTwo.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return FormBuilder(
                                  onChanged: () {
                                    // _formKey.currentState!.save();
                                    // debugPrint(_formKey.currentState!.value.toString());
                                  },
                                  autovalidateMode: AutovalidateMode.always,
                                  child: FormBuilderRadioGroup<Answers>(
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: kBlackText,
                                          fontSize: 18,
                                          fontFamily: 'DinBold'),
                                      labelText: cubit.listOfCategoryTwo[index]
                                          .question!.description
                                          .toString(),
                                      suffixIcon: InkWell(
                                          onTap: () => speech.speak(cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .description
                                              .toString() +
                                              '${cubit.listOfCategoryTwo[index].question!.answers!.map((lang) => lang.answerOption)}'),
                                          child: Image.asset(
                                              "assets/images/Earphone.png")),
                                      suffix: cubit.shouldShowTextField(
                                          questionId: cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!)
                                          ? SizedBox(
                                          height: 60,
                                          width: 150,
                                          child: TextFormField())
                                          : null,
                                    ),

                                    initialValue: null,
                                    name: 'best_language',
                                    onChanged: (value) {
                                      log('$value');
                                      if (value != null) {
                                        setState(() {
                                          cubit.answer[cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!] = value;
                                        });
                                      }


                                    },
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'من فضلك أجب علي هذا السؤال';
                                    //   }
                                    //   return 'تمام';
                                    // },
                                    options: cubit.listOfCategoryTwo[index]
                                        .question!.answers!
                                        .map((lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: customText3(
                                          title: lang.answerOption
                                              .toString(),
                                          color: kBlackText),
                                    ))
                                        .toList(growable: false),
                                    controlAffinity: ControlAffinity.trailing,
                                  ),
                                );
                              })
                        ],
                      ),
                      buildSizedBoxed(height),
                      ExpansionTile(
                        collapsedBackgroundColor: kSky2Button,
                        iconColor: kPrimaryColor,
                        childrenPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        title: customBoldText(
                            title: "مناسبة تقلل او تزيد التلعثم",
                            color: kPrimaryColor),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.listOfCategoryTwo.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return FormBuilder(
                                  onChanged: () {
                                    // _formKey.currentState!.save();
                                    // debugPrint(_formKey.currentState!.value.toString());
                                  },
                                  autovalidateMode: AutovalidateMode.always,
                                  child: FormBuilderRadioGroup<Answers>(
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: kBlackText,
                                          fontSize: 18,
                                          fontFamily: 'DinBold'),
                                      labelText: cubit.listOfCategoryTwo[index]
                                          .question!.description
                                          .toString(),
                                      suffixIcon: InkWell(
                                          onTap: () => speech.speak(cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .description
                                              .toString() +
                                              '${cubit.listOfCategoryTwo[index].question!.answers!.map((lang) => lang.answerOption)}'),
                                          child: Image.asset(
                                              "assets/images/Earphone.png")),
                                      suffix: cubit.shouldShowTextField(
                                          questionId: cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!)
                                          ? SizedBox(
                                          height: 60,
                                          width: 150,
                                          child: TextFormField())
                                          : null,
                                    ),

                                    initialValue: null,
                                    name: 'best_language',
                                    onChanged: (value) {
                                      log('$value');
                                      if (value != null) {
                                        setState(() {
                                          cubit.answer[cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!] = value;
                                        });
                                      }


                                    },
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'من فضلك أجب علي هذا السؤال';
                                    //   }
                                    //   return 'تمام';
                                    // },
                                    options: cubit.listOfCategoryTwo[index]
                                        .question!.answers!
                                        .map((lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: customText3(
                                          title: lang.answerOption
                                              .toString(),
                                          color: kBlackText),
                                    ))
                                        .toList(growable: false),
                                    controlAffinity: ControlAffinity.trailing,
                                  ),
                                );
                              })
                        ],
                      ),
                      buildSizedBoxed(height),
                      ExpansionTile(
                        collapsedBackgroundColor: kSky2Button,
                        iconColor: kPrimaryColor,
                        childrenPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        title: customBoldText(
                            title: "سلوك التجنب", color: kPrimaryColor),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.listOfCategoryTwo.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return FormBuilder(
                                  onChanged: () {
                                    // _formKey.currentState!.save();
                                    // debugPrint(_formKey.currentState!.value.toString());
                                  },
                                  autovalidateMode: AutovalidateMode.always,
                                  child: FormBuilderRadioGroup<Answers>(
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: kBlackText,
                                          fontSize: 18,
                                          fontFamily: 'DinBold'),
                                      labelText: cubit.listOfCategoryTwo[index]
                                          .question!.description
                                          .toString(),
                                      suffixIcon: InkWell(
                                          onTap: () => speech.speak(cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .description
                                              .toString() +
                                              '${cubit.listOfCategoryTwo[index].question!.answers!.map((lang) => lang.answerOption)}'),
                                          child: Image.asset(
                                              "assets/images/Earphone.png")),
                                      suffix: cubit.shouldShowTextField(
                                          questionId: cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!)
                                          ? SizedBox(
                                          height: 60,
                                          width: 150,
                                          child: TextFormField())
                                          : null,
                                    ),

                                    initialValue: null,
                                    name: 'best_language',
                                    onChanged: (value) {
                                      log('$value');
                                      if (value != null) {
                                        setState(() {
                                          cubit.answer[cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!] = value;
                                        });
                                      }


                                    },
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'من فضلك أجب علي هذا السؤال';
                                    //   }
                                    //   return 'تمام';
                                    // },
                                    options: cubit.listOfCategoryTwo[index]
                                        .question!.answers!
                                        .map((lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: customText3(
                                          title: lang.answerOption
                                              .toString(),
                                          color: kBlackText),
                                    ))
                                        .toList(growable: false),
                                    controlAffinity: ControlAffinity.trailing,
                                  ),
                                );
                              })
                        ],
                      ),
                      buildSizedBoxed(height),
                      ExpansionTile(
                        collapsedBackgroundColor: kSky2Button,
                        iconColor: kPrimaryColor,
                        childrenPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        title: customBoldText(
                            title: "تقييم سلوك التلعثم", color: kPrimaryColor),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.listOfCategoryTwo.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return FormBuilder(
                                  onChanged: () {
                                    // _formKey.currentState!.save();
                                    // debugPrint(_formKey.currentState!.value.toString());
                                  },
                                  autovalidateMode: AutovalidateMode.always,
                                  child: FormBuilderRadioGroup<Answers>(
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: kBlackText,
                                          fontSize: 18,
                                          fontFamily: 'DinBold'),
                                      labelText: cubit.listOfCategoryTwo[index]
                                          .question!.description
                                          .toString(),
                                      suffixIcon: InkWell(
                                          onTap: () => speech.speak(cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .description
                                              .toString() +
                                              '${cubit.listOfCategoryTwo[index].question!.answers!.map((lang) => lang.answerOption)}'),
                                          child: Image.asset(
                                              "assets/images/Earphone.png")),
                                      suffix: cubit.shouldShowTextField(
                                          questionId: cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!)
                                          ? SizedBox(
                                          height: 60,
                                          width: 150,
                                          child: TextFormField())
                                          : null,
                                    ),

                                    initialValue: null,
                                    name: 'best_language',
                                    onChanged: (value) {
                                      log('$value');
                                      if (value != null) {
                                        setState(() {
                                          cubit.answer[cubit
                                              .listOfCategoryTwo[index]
                                              .question!
                                              .id!] = value;
                                        });
                                      }


                                    },
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'من فضلك أجب علي هذا السؤال';
                                    //   }
                                    //   return 'تمام';
                                    // },
                                    options: cubit.listOfCategoryTwo[index]
                                        .question!.answers!
                                        .map((lang) => FormBuilderFieldOption(
                                      value: lang,
                                      child: customText3(
                                          title: lang.answerOption
                                              .toString(),
                                          color: kBlackText),
                                    ))
                                        .toList(growable: false),
                                    controlAffinity: ControlAffinity.trailing,
                                  ),
                                );
                              })
                        ],
                      ),
                      buildSizedBoxed(height),
                      MediaButton(
                        onPressed: () {
                          // speech.speak(KeysConfig.studyingPrivatePublicSchool );
                          navigateTo(
                              context,
                              SuccessView(
                                title1:
                                    "لقد تم إنتهاء إختبار التاريخ المرضي بنجاح",
                                title2: "إنتقال إلي إختبار Oases",
                                onTap: () => navigateTo(
                                    context, const DiagnosticOasesTest()),
                              ));
                        },
                        title: KeysConfig.next,
                      ),
                      SizedBox(
                        height: height * 0.2,
                      ),
                    ],
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
        height: height * 0.025,
      );
}
