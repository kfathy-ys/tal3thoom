import 'dart:developer';
import 'dart:io';

import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/evaluation_section/page/rich_text.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../home/pages/views/reservations_schedule/view.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/customTextFieldToUploadFile.dart';
import '../../../../../../../widgets/mediaButton.dart';
import '../../../../../../../widgets/smallButtonSizer.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/question.dart';
import '../../../../../diagnostic_service/page/views/success_page.dart';


// ignore: must_be_immutable
class EvaluationSectionScreen extends StatefulWidget {
  @override
  State<EvaluationSectionScreen> createState() =>
      _EvaluationSectionScreenState();
}

class _EvaluationSectionScreenState extends State<EvaluationSectionScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _firstController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kHomeColor,
      drawer: MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: () => scaffoldKey.currentState!.openDrawer()),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          height: height,
          width: width,
          color: kHomeColor,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTileContainer(
                      widthh: width / 1.8,
                      title: "الجلسة العلاجية الأولي",
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
                        width: width*0.1,
                        height: height*0.35,
                        color: kPrimaryColor,
                        child: Center(
                          child: customText3(title: "1", color: kHomeColor),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 14),
                       padding: const EdgeInsets.symmetric(horizontal: 8),
                       // height: height * 0.2,
                        width: width * 0.8,
                        decoration:
                            BoxDecoration(border: Border.all(color: kLightText)),
                        child:Column(
                              children: [
                                RichTextCustom(),
                                ListView.builder(
                                    padding: const EdgeInsets.symmetric(vertical: 4),
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
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                        width: width*0.1,
                        height: height*0.39,
                        color: kPrimaryColor,
                        child: Center(
                          child: customText3(title: "2", color: kHomeColor),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 14),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        // height: height * 0.2,
                        width: width * 0.8,
                        decoration:
                        BoxDecoration(border: Border.all(color: kLightText)),
                        child: Column(
                          children: [
                            RichTextCustom2(),
                            ListView.builder(
                                padding: const EdgeInsets.symmetric(vertical: 4),
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
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                      navigateTo(context, Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SuccessView(title1: "لقد اتممت الجلسة العلاجية وسيتم تحويلك إلي الجلسة التالية عن طريق المختص بعد تقييمة لنتائج الجلسة والفيديو التي قمت بارسالة",title2: "تدريب وتعليم إضافي",
                          onTap: ()=>navigateTo(context, ReservationsSchedule()),),
                      ));
                    },
                    color: kButtonGreenDark,
                    title: "متابعة",
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget buildTable(double height, double width,
      {required Color color,
      required String title1,
      required String title2,
      required String title3}) {
    return Container(
      height: height * 0.059,
      width: width * 0.8,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: kAppBarColor),
        //  borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisSize: MainAxisSize.min,
        children: [
          customText3(title: title1, color: kBlackText),
          customText3(title: title2, color: kBlackText),
          customText3(title: title3, color: kBlackText)
        ],
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

Widget uploadedVideo({
  required double height,
  required String title,
  required dynamic validator,
  required TextEditingController controller,
  required VoidCallback onPressed1,
  required BuildContext context,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      CustomTextFieldUploadFile(
        controller: controller,
        validator: validator,
        type: TextInputType.text,
      ),
      SmallButtonSizer(
        title: "Browse",
        onPressed: onPressed1,
        color: kTextFieldColor,
        image: "assets/images/eye.png",
      ),
    ],
  );
}
