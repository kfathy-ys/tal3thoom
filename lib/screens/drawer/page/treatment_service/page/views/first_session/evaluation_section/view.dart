import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/evaluation_section/page/rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../../widgets/mediaButton.dart';
import '../../../../../../view.dart';
import 'cubit/evaluation_cubit.dart';

// ignore: must_be_immutable
class EvaluationSectionScreen extends StatefulWidget {
  @override
  State<EvaluationSectionScreen> createState() =>
      _EvaluationSectionScreenState();
}

class _EvaluationSectionScreenState extends State<EvaluationSectionScreen> {
  // @override
  // void initState() {
  //   BlocProvider.of<ProfileCubit>(context);
  //   super.initState();
  // }
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
        child: SingleChildScrollView(
          child: BlocConsumer<EvaluationCubit, EvaluationState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              final cubit = BlocProvider.of<EvaluationCubit>(context);

              if (state is EvaluationLoading) {
                return const Center(
                  child: LoadingFadingCircle(),
                );
              }
              if (state is EvaluationSuccess) {
                return Form(
                  key: cubit.formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTileContainer(
                            widthh: context.width / 1.6,
                            title: "الجلسة العلاجية " +
                                state.questionEvaluation[0].tags.toString(),
                            context: context),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: customText2(
                                  title: "القسم التقيمي :", color: kLightText),
                            )),
                        Row(
                          children: [
                            Container(
                              width: context.width * 0.1,
                              height: context.height * 0.35,
                              color: kPrimaryColor,
                              child: Center(
                                child:
                                    customText3(title: "1", color: kHomeColor),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 14),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              // height: context.height * 0.2,
                              width: context.width * 0.8,
                              decoration: BoxDecoration(
                                  border: Border.all(color: kLightText)),
                              child: Column(
                                children: [
                                  RichTextCustom(),
                                  ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return FormBuilder(
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          child: FormBuilderRadioGroup<dynamic>(
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              labelStyle: TextStyle(
                                                  color: kBlackText,
                                                  fontSize: 18,
                                                  fontFamily: 'DinBold'),
                                              // labelText: state.questionEvaluation[0].description.toString(),
                                            ),
                                            initialValue: cubit.answer[
                                                state.questionEvaluation[0]],
                                            name: 'best_language',
                                            onChanged: (value) {
                                              log('$value');
                                              if (value != null) {
                                                setState(() {
                                                  cubit.answer[
                                                      state.questionEvaluation[
                                                          0]] = value;
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
                                                .questionEvaluation[0].answers
                                                .map((lang) =>
                                                    FormBuilderFieldOption(
                                                      value: lang,
                                                      child: customText3(
                                                          title: lang
                                                              .answerOption
                                                              .toString(),
                                                          color: kBlackText),
                                                    ))
                                                .toList(growable: false),
                                            controlAffinity:
                                                ControlAffinity.trailing,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: context.width * 0.1,
                              height: context.height * 0.39,
                              color: kPrimaryColor,
                              child: Center(
                                child:
                                    customText3(title: "2", color: kHomeColor),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 14),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              // height: context.height * 0.2,
                              width: context.width * 0.8,
                              decoration: BoxDecoration(
                                  border: Border.all(color: kLightText)),
                              child: Column(
                                children: [
                                  RichTextCustom2(),
                                  ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return FormBuilder(
                                          onChanged: () {
                                            // _formKey.currentState!.save();
                                            // debugPrint(_formKey.currentState!.value.toString());
                                          },
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          child: FormBuilderRadioGroup<dynamic>(
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              labelStyle: TextStyle(
                                                  color: kBlackText,
                                                  fontSize: 18,
                                                  fontFamily: 'DinBold'),
                                              // labelText: evaluateNumber[index].name,
                                            ),
                                            initialValue: cubit.answer[
                                                state.questionEvaluation[1]],
                                            name: 'best_language',
                                            onChanged: (value) {
                                              log('$value');
                                              if (value != null) {
                                                setState(() {
                                                  cubit.answer[
                                                      state.questionEvaluation[
                                                          1]] = value;
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
                                                .questionEvaluation[1].answers
                                                .map((lang) =>
                                                    FormBuilderFieldOption(
                                                      value: lang,
                                                      child: customText3(
                                                          title: lang
                                                              .answerOption
                                                              .toString(),
                                                          color: kBlackText),
                                                    ))
                                                .toList(growable: false),
                                            controlAffinity:
                                                ControlAffinity.trailing,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                        MediaButton(
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              BlocProvider.of<EvaluationCubit>(context)
                                  .getEvaluationSection();

                              cubit.sendEvaluationSectionAnswers();
                            }
                          },
                          color: kPrimaryColor,
                          title: "متابعة",
                        ),
                      ]),
                );
              }
              if (state is EvaluationError) {
                return Text(state.msg);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
