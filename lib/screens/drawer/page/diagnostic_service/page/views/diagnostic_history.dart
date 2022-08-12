import 'package:tal3thoom/config/text_to_speech.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/success_page.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../../config/keys.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../view.dart';
import 'diagnostci_oases_test/view.dart';



// ignore: must_be_immutable
class DiagnosticHistory extends StatefulWidget {
  @override
  State<DiagnosticHistory> createState() => _DiagnosticHistoryState();
}

class _DiagnosticHistoryState extends State<DiagnosticHistory> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  Speech speech = Speech();
final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(

          context: context,
          press: () => _scaffoldKey.currentState!.openDrawer()),
      body: SingleChildScrollView(

          child: Container(
            height: height,
            width: width ,
            color: kHomeColor,

              child: ListView(
padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTile(
                          widthh: width * 0.5,
                          title: KeysConfig.medicalHistory ,
                          context: context),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Center(child: customBoldText(title: KeysConfig.firstTest , color: kBlackText)),
                  ),
                  Image.asset(
                    "assets/images/255.png",
                  ),
                  buildSizedBoxed(height),
                  ExpansionTile(
                    collapsedBackgroundColor: kSky2Button,
                    iconColor: kPrimaryColor,
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                    // tilePadding: EdgeInsets.symmetric(vertical: 8),
                    title: customBoldText(
                        title: KeysConfig.informationEdu , color: kPrimaryColor),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                          itemCount: firstQuestionsList.length,
                           physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context ,index){
                        return  FormBuilder(
                          onChanged: () {
                            // _formKey.currentState!.save();
                            // debugPrint(_formKey.currentState!.value.toString());
                          },
                          autovalidateMode: AutovalidateMode.always,
                          child: FormBuilderRadioGroup< dynamic>(

                            decoration: InputDecoration(

                              labelStyle: const TextStyle(
                                  color: kBlackText,
                                  fontSize: 18,
                                  fontFamily: 'DinBold'),
                              labelText: firstQuestionsList[index].name,
                              suffixIcon:InkWell(
                                  onTap: firstQuestionsList[index].onTap,
                                  child: Image.asset("assets/images/Earphone.png")) ,
                              suffix: firstQuestionsList[index].isAvailableTextField != null &&
                                  firstQuestionsList[index].isAvailableTextField== true?
                              SizedBox(height: 60,width: 150 ,child: TextFormField()): const SizedBox.shrink(),
                             // counter:  InkWell(
                             //     onTap: firstQuestionsList[index].onTap,
                             //     child: Image.asset("assets/images/Earphone.png")),

                            ),

                            initialValue: null,
                            name: 'best_language',

                            onChanged: (value){
                              print(value);
                              firstQuestionsList[index].selectedValue =value;
                              if(value=="other" ){
                                setState(() {
                                  firstQuestionsList[index].isAvailableTextField = true;
                                });
                              }
                              if(value!="other" && firstQuestionsList[index].isAvailableTextField==true ){
                                setState(() {
                                  firstQuestionsList[index].isAvailableTextField = false;
                                });
                              }
                              if(firstQuestionsList[index].isAvailableTextField == true ){
                                firstQuestionsList[index].textFieldValue  = value;
                                print("$value");
                              }
                            },
                           // validator:  (value) => value.isEmpty ? KeysConfig.thisFieldRequired :null,
                            options: firstQuestionsList[index].answersList!
                                .map((lang) => FormBuilderFieldOption(
                              value: lang["value"],
                              child: customText3(
                                  title: lang["name"], color: kBlackText),
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
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: customBoldText(
                        title: "تاريخ الامراض السابقة ", color: kPrimaryColor),

                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: secondQuestionsList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context ,index){
                            return  FormBuilder(
                              onChanged: () {
                                // _formKey.currentState!.save();
                                // debugPrint(_formKey.currentState!.value.toString());
                              },
                              autovalidateMode: AutovalidateMode.disabled,
                              child: FormBuilderRadioGroup< dynamic>(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: kBlackText,
                                      fontSize: 18,
                                      fontFamily: 'DinBold'),
                                  labelText:
                                  secondQuestionsList[index].name,
                                ),
                                initialValue: null,
                                name: 'best_language',
                                onChanged: (value){
                                  print(value);
                                  secondQuestionsList[index].selectedValue =value;
                                },
                                // validator: qValidator([
                                //   IsRequired(""),
                                // ]),
                                options: secondQuestionsList[index].answersList!
                                    .map((lang) => FormBuilderFieldOption(
                                  value: lang["value"],
                                  child: customText3(
                                      title: lang["name"], color: kBlackText),
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
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: customBoldText(
                        title: "تاريخ التأتأة", color: kPrimaryColor),

                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: fifthQuestionsList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context ,index){
                            return  FormBuilder(
                              onChanged: () {
                                // _formKey.currentState!.save();
                                // debugPrint(_formKey.currentState!.value.toString());
                              },
                              autovalidateMode: AutovalidateMode.disabled,
                              child: FormBuilderRadioGroup< dynamic>(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: kBlackText,
                                      fontSize: 18,
                                      fontFamily: 'DinBold'),
                                  labelText:
                                  fifthQuestionsList[index].name,
                                ),
                                initialValue: null,
                                name: 'best_language',
                                onChanged: (value){
                                  print(value);
                                  fifthQuestionsList[index].selectedValue =value;
                                },
                                // validator: qValidator([
                                //   IsRequired(""),
                                // ]),
                                options: fifthQuestionsList[index].answersList!
                                    .map((lang) => FormBuilderFieldOption(
                                  value: lang["value"],
                                  child: customText3(
                                      title: lang["name"], color: kBlackText),
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
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: customBoldText(
                        title: "مناسبة تقلل او تزيد التلعثم", color: kPrimaryColor),

                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: fifthQuestionsList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context ,index){
                            return  FormBuilder(
                              onChanged: () {
                                // _formKey.currentState!.save();
                                // debugPrint(_formKey.currentState!.value.toString());
                              },
                              autovalidateMode: AutovalidateMode.disabled,
                              child: FormBuilderRadioGroup< dynamic>(


                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(

                                      color: kBlackText,
                                      fontSize: 18,
                                      fontFamily: 'DinBold'),
                                  labelText:
                                  fifthQuestionsList[index].name,
                                ),
                                initialValue: null,
                                name: 'best_language',
                                onChanged: (value){
                                  print(value);
                                  fifthQuestionsList[index].selectedValue =value;
                                },
                                // validator: qValidator([
                                //   IsRequired(""),
                                // ]),
                                options: fifthQuestionsList[index].answersList!
                                    .map((lang) => FormBuilderFieldOption(
                                  value: lang["value"],
                                  child: customText3(
                                      title: lang["name"], color: kBlackText),
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
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: customBoldText(
                        title: "سلوك التجنب", color: kPrimaryColor),

                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: fifthQuestionsList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context ,index){
                            return  FormBuilder(
                              onChanged: () {
                                // _formKey.currentState!.save();
                                // debugPrint(_formKey.currentState!.value.toString());
                              },
                              autovalidateMode: AutovalidateMode.disabled,
                              child: FormBuilderRadioGroup< dynamic>(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: kBlackText,
                                      fontSize: 18,
                                      fontFamily: 'DinBold'),
                                  labelText:
                                  fifthQuestionsList[index].name,
                                ),
                                initialValue: null,
                                name: 'best_language',
                                onChanged: (value){
                                  print(value);
                                  fifthQuestionsList[index].selectedValue =value;
                                },
                                // validator: qValidator([
                                //   IsRequired(""),
                                // ]),
                                options: fifthQuestionsList[index].answersList!
                                    .map((lang) => FormBuilderFieldOption(
                                  value: lang["value"],
                                  child: customText3(
                                      title: lang["name"], color: kBlackText),
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
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: customBoldText(
                        title: "تقييم سلوك التلعثم", color: kPrimaryColor),

                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: sixQuestionsList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context ,index){
                            return  FormBuilder(
                              onChanged: () {
                                // _formKey.currentState!.save();
                                // debugPrint(_formKey.currentState!.value.toString());
                              },
                              autovalidateMode: AutovalidateMode.disabled,
                              child: FormBuilderRadioGroup< dynamic>(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: kBlackText,
                                      fontSize: 18,
                                      fontFamily: 'DinBold'),
                                  labelText:
                                  sixQuestionsList[index].name,
                                ),
                                initialValue: null,
                                name: 'best_language',
                                onChanged: (value){
                                  print(value);
                                  sixQuestionsList[index].selectedValue =value;
                                },
                                // validator: qValidator([
                                //   IsRequired(""),
                                // ]),
                                options: sixQuestionsList[index].answersList!
                                    .map((lang) => FormBuilderFieldOption(
                                  value: lang["value"],
                                  child: customText3(
                                      title: lang["name"], color: kBlackText),
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
                      navigateTo(context, SuccessView(title1: "لقد تم إنتهاء إختبار التاريخ المرضي بنجاح",title2: "إنتقال إلي إختبار Oases",
                        onTap: ()=>navigateTo(context, const DiagnosticOasesTest()),));
                    },
                    title: KeysConfig.next ,
                  ),
                 SizedBox(height: height*0.2,),
                ],
              ),

          ),

      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(
        height: height * 0.05,
      );

  SizedBox buildSizedBoxed(double height) => SizedBox(
    height: height * 0.025,
  );
}


