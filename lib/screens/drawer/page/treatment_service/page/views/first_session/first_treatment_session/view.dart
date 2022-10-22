import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/customButton.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../../widgets/video_items.dart';
import '../../../../../../view.dart';
import '../sloki/view.dart';
import 'cubit/cognitive_section_cubit.dart';

// ignore: must_be_immutable

class FirstTreatmentSession extends StatefulWidget {
  const FirstTreatmentSession({Key? key}) : super(key: key);

  @override
  State<FirstTreatmentSession> createState() => _FirstTreatmentSessionState();
}

class _FirstTreatmentSessionState extends State<FirstTreatmentSession> {
  @override
  Widget build(BuildContext context) {
    final currentStage = Prefs.getString("currentStage");

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
        child: SingleChildScrollView(
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTileContainer(
                            widthh: context.width / 1.8,
                            title: "الجلسة العلاجية"+cubit.questionList[0].tags.toString(),
                            context: context),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4),
                          child: Image.asset(
                            "assets/images/marfi.png",
                          ),
                        ),

                        ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 4),
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
                                      :      Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 4),
                                        width: context.width * 0.8,
                                       // height: context.height * 0.14,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              topLeft: Radius.circular(8),
                                            ),
                                            color: kBackgroundButton),
                                        child: FormBuilder(
                                                autovalidateMode:
                                                    AutovalidateMode.always,
                                                child: FormBuilderRadioGroup<
                                                    dynamic>(
                                                  decoration: InputDecoration(
                                                    labelStyle: const TextStyle(
                                                        color: kBlackText,
                                                        fontSize: 18,
                                                        fontFamily: 'DinBold'),
                                                    labelText: "${index + 1} " +state
                                                        .questionModel[index]
                                                        .description,
                                                  ),
                                                  initialValue: cubit.answer[state.questionModel[index]],
                                                  name: 'best_language',
                                                  onChanged: (value) {
                                                    log('$value');
                                                    if (value != null) {
                                                      setState(() {
                                                        cubit.answer[state
                                                            .questionModel[index]] = value;
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
                                                      .questionModel[index]
                                                      .answers
                                                      .map((lang) =>
                                                          FormBuilderFieldOption(
                                                            value: lang,
                                                            child: customText3(
                                                                title: lang
                                                                    .answerOption
                                                                    .toString(),
                                                                color:
                                                                    kBlackText),
                                                          ))
                                                      .toList(growable: false),
                                                  controlAffinity:
                                                      ControlAffinity.trailing,
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                  state
                                      .questionModel[index]
                                      .videoFile== null ? const SizedBox.shrink():  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    width: context.width * 0.8,
                                    height: context.height * 0.25,
                                    child: VideoItems(
                                      videoPlayerController:
                                          VideoPlayerController.network(
                                              state
                                                  .questionModel[index]
                                                  .videoFile,
                                      ),
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
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.sendCognitiveSectionAnswers();
                            }
                           // navigateTo(context, const SlokiScreen());
                          },
                        ),
                      ]),
                );
              }
              if (state is CognitiveSectionError) {
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
