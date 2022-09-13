import 'dart:developer';
import 'dart:io';

import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/evaluation_section/page/rich_text.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/mediaButton.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/question.dart';
import '../../../../../diagnostic_service/page/views/success_page.dart';
import '../second_stage_additional_traning/view.dart';

// ignore: must_be_immutable
class SecondTreatmentSessionEvaluation extends StatefulWidget {
  const SecondTreatmentSessionEvaluation({Key? key}) : super(key: key);

  @override
  State<SecondTreatmentSessionEvaluation> createState() =>
      _SecondTreatmentSessionEvaluationState();
}

class _SecondTreatmentSessionEvaluationState
    extends State<SecondTreatmentSessionEvaluation> {
  final _firstController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          height: context.height,
          width: context.width,
          color: kHomeColor,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTileContainer(
                      widthh: context.width * 0.6,
                      title: "الجلسة العلاجية السادسة عشر",
                      context: context),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                          child: customText3(title: "1", color: kHomeColor),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 14),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        // height: context.height * 0.2,
                        width: context.width * 0.8,
                        decoration: BoxDecoration(
                            border: Border.all(color: kLightText)),
                        child: Column(
                          children: [
                            RichTextCustom(),
                            ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: evaluateNumber.length,
                                itemBuilder: (context, index) {
                                  return FormBuilder(
                                    onChanged: () {
                                      // _formKey.currentState!.save();
                                      // debugPrint(_formKey.currentState!.value.toString());
                                    },
                                    autovalidateMode: AutovalidateMode.always,
                                    child: FormBuilderRadioGroup<dynamic>(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10),
                                        labelStyle: const TextStyle(
                                            color: kBlackText,
                                            fontSize: 18,
                                            fontFamily: 'DinBold'),
                                        labelText: evaluateNumber[index].name,
                                      ),
                                      initialValue: null,
                                      name: 'best_language',

                                      onChanged: (value) {
                                        // print(value);
                                        // evaluateNumber[index].selectedValue =
                                        //     value;
                                        // if (value == "other") {
                                        //   setState(() {
                                        //     evaluateNumber[index]
                                        //         .isAvailableTextField = true;
                                        //   });
                                        // }
                                        // if (value != "other" &&
                                        //     evaluateNumber[index]
                                        //             .isAvailableTextField ==
                                        //         true) {
                                        //   setState(() {
                                        //     evaluateNumber[index]
                                        //         .isAvailableTextField = false;
                                        //   });
                                        // }
                                        // if (evaluateNumber[index]
                                        //         .isAvailableTextField ==
                                        //     true) {
                                        //   evaluateNumber[index].textFieldValue =
                                        //       value;
                                        //   print("$value");
                                        // }
                                      },
                                      // validator:  (value) => value.isEmpty ? KeysConfig.thisFieldRequired :null,
                                      options: evaluateNumber[index]
                                          .answersList!
                                          .map((lang) => FormBuilderFieldOption(
                                                value: lang["value"],
                                                child: customText3(
                                                    title: lang["name"],
                                                    color: kBlackText),
                                              ))
                                          .toList(growable: false),
                                      controlAffinity: ControlAffinity.trailing,
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
                          child: customText3(title: "2", color: kHomeColor),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 14),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        // height: context.height * 0.2,
                        width: context.width * 0.8,
                        decoration: BoxDecoration(
                            border: Border.all(color: kLightText)),
                        child: Column(
                          children: [
                            RichTextCustom2(),
                            ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: evaluateNumber.length,
                                itemBuilder: (context, index) {
                                  return FormBuilder(
                                    onChanged: () {
                                      // _formKey.currentState!.save();
                                      // debugPrint(_formKey.currentState!.value.toString());
                                    },
                                    autovalidateMode: AutovalidateMode.always,
                                    child: FormBuilderRadioGroup<dynamic>(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10),
                                        labelStyle: const TextStyle(
                                            color: kBlackText,
                                            fontSize: 18,
                                            fontFamily: 'DinBold'),
                                        labelText: evaluateNumber[index].name,
                                      ),
                                      initialValue: null,
                                      name: 'best_language',

                                      onChanged: (value) {
                                        // print(value);
                                        // evaluateNumber[index].selectedValue =
                                        //     value;
                                        // if (value == "other") {
                                        //   setState(() {
                                        //     evaluateNumber[index]
                                        //         .isAvailableTextField = true;
                                        //   });
                                        // }
                                        // if (value != "other" &&
                                        //     evaluateNumber[index]
                                        //             .isAvailableTextField ==
                                        //         true) {
                                        //   setState(() {
                                        //     evaluateNumber[index]
                                        //         .isAvailableTextField = false;
                                        //   });
                                        // }
                                        // if (evaluateNumber[index]
                                        //         .isAvailableTextField ==
                                        //     true) {
                                        //   evaluateNumber[index].textFieldValue =
                                        //       value;
                                        //   print("$value");
                                        // }
                                      },
                                      // validator:  (value) => value.isEmpty ? KeysConfig.thisFieldRequired :null,
                                      options: evaluateNumber[index]
                                          .answersList!
                                          .map((lang) => FormBuilderFieldOption(
                                                value: lang["value"],
                                                child: customText3(
                                                    title: lang["name"],
                                                    color: kBlackText),
                                              ))
                                          .toList(growable: false),
                                      controlAffinity: ControlAffinity.trailing,
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
                      navigateTo(
                          context,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SuccessView(
                              title1:
                                  "لقد اتممت الجلسة العلاجية وسيتم تحويلك إلي الجلسة التالية عن طريق المختص بعد تقييمة لنتائج الجلسة والفيديو التي قمت بارسالة",
                              title2: "تدريب وتعليم إضافي",
                              onTap: () => navigateTo(context,
                                  const SecondStageAdditionalTrainingScreen()),
                            ),
                          ));
                    },
                    color: kPrimaryColor,
                    title: "متابعة",
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  dynamic video;

  File? _file1;

  void _uploadFile(int step) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
    );

    if (result != null) {
      File? file = File(result.files.single.path!);

      log("-=-=-=-=- selected file is => ${file.toString()}");
      setState(() {
        _file1 = file;
        //  filesInputData.thesisFile = file;

        _firstController.text = file.path;
      });
    } else {
      log("NOT Catch ONE SORRY FOR THAT .... TRY AGAIN");
    }
  }
}
