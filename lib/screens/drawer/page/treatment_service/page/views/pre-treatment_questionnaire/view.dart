import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/customButton.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../view.dart';
import 'cubit/pre_questionnaire_cubit.dart';

// ignore: must_be_immutable
class PretreatmentQuestionnaire extends StatefulWidget {
  const PretreatmentQuestionnaire({Key? key}) : super(key: key);

  @override
  State<PretreatmentQuestionnaire> createState() =>
      _PretreatmentQuestionnaireState();
}

class _PretreatmentQuestionnaireState extends State<PretreatmentQuestionnaire> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
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
        child: BlocConsumer<PreQuestionnaireCubit, PreQuestionnaireState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<PreQuestionnaireCubit>(context);

            if (state is PreQuestionnaireLoading) {
              return const Center(
                child: LoadingFadingCubeGrid(),
              );
            }
            if (state is PreQuestionnaireSuccess) {
              return Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      CustomTileContainer(
                          widthh: context.width / 1.8,
                          title: "استبيان ما قبل العلاج",
                          context: context),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4),
                        child: Image.asset(
                          "assets/images/box01.png",
                        ),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.preQuestionnaireModel.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: const BoxDecoration(
                                color: kBackgroundButton,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: FormBuilder(
                              autovalidateMode: AutovalidateMode.always,
                              child: FormBuilderRadioGroup<dynamic>(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: kBlackText,
                                      fontSize: 18,
                                      fontFamily: 'DinBold'),
                                  labelText: "${index + 1} - " +
                                      state.preQuestionnaireModel[index]
                                          .description,
                                ),
                                initialValue: cubit
                                    .answer[state.preQuestionnaireModel[index]],
                                name: 'best_language',
                                onChanged: (value) {
                                  log('$value');
                                  if (value != null) {
                                    setState(() {
                                      cubit.answer[state
                                              .preQuestionnaireModel[index]] =
                                          value;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'من فضلك أجب علي المدون أعلاة ';
                                  }
                                  return '';
                                },
                                options: state
                                    .preQuestionnaireModel[index].answers
                                    .map((lang) => FormBuilderFieldOption(
                                          value: lang,
                                          child: customText3(
                                              title:
                                                  lang.answerOption.toString(),
                                              color: kBlackText),
                                        ))
                                    .toList(growable: false),
                                controlAffinity: ControlAffinity.trailing,
                              ),
                            ),
                          );
                        },
                      ),
                      CustomButton(
                        color: kPrimaryColor,
                        title: "الإنتقال إلي المرحلة العلاجيه الأولي",
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.postPreQuestionnaireAnswers();
                          }
                        },
                      ),
                    ])),
              );
            }
            if (state is PreQuestionnaireError) {
              BlocProvider.of<PreQuestionnaireCubit>(context)
                  .getPreQuestionnaire();            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
