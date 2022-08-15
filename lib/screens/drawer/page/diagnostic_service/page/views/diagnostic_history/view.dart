import 'package:tal3thoom/config/text_to_speech.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/success_page.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../config/keys.dart';
import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../view.dart';
import '../diagnostci_oases_test/view.dart';



// ignore: must_be_immutable
class DiagnosticHistory extends StatefulWidget {
  const DiagnosticHistory({Key? key}) : super(key: key);

  @override
  State<DiagnosticHistory> createState() => _DiagnosticHistoryState();
}

class _DiagnosticHistoryState extends State<DiagnosticHistory> {
final _scaffoldKey = GlobalKey<ScaffoldState>();


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
                            decoration:InputDecoration(

                              labelStyle: const TextStyle(
                                  color: kBlackText,
                                  fontSize: 18,
                                  fontFamily: 'DinBold'),
                              labelText: secondQuestionsList[index].name,
                              suffixIcon:InkWell(
                                  onTap: secondQuestionsList[index].onTap,
                                  child: Image.asset("assets/images/Earphone.png")) ,
                              suffix: secondQuestionsList[index].isAvailableTextField != null &&
                                  secondQuestionsList[index].isAvailableTextField== true?
                              SizedBox(height: 60,width: 150 ,child: TextFormField()): const SizedBox.shrink(),


                            ),



                            initialValue: null,
                            name: 'best_language',
                            onChanged: (value){
                              print(value);
                              secondQuestionsList[index].selectedValue =value;
                              if(value=="other" ){
                                setState(() {
                                  secondQuestionsList[index].isAvailableTextField = true;
                                });
                              }
                              if(value!="other" && secondQuestionsList[index].isAvailableTextField==true ){
                                setState(() {
                                  secondQuestionsList[index].isAvailableTextField = false;
                                });
                              }
                              if(secondQuestionsList[index].isAvailableTextField == true ){
                                secondQuestionsList[index].textFieldValue  = value;
                                print("$value");
                              }
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
                              labelText: fifthQuestionsList[index].name,
                              suffixIcon:InkWell(
                                  onTap: fifthQuestionsList[index].onTap,
                                  child: Image.asset("assets/images/Earphone.png")) ,
                              suffix: fifthQuestionsList[index].isAvailableTextField != null &&
                                  fifthQuestionsList[index].isAvailableTextField== true?
                              SizedBox(height: 60,width: 150 ,child: TextFormField()): const SizedBox.shrink(),


                            ),
                            initialValue: null,
                            name: 'best_language',
                            onChanged: (value){
                              print(value);
                              fifthQuestionsList[index].selectedValue =value;
                              if(value=="other" ){
                                setState(() {
                                  fifthQuestionsList[index].isAvailableTextField = true;
                                });
                              }
                              if(value!="other" && fifthQuestionsList[index].isAvailableTextField==true ){
                                setState(() {
                                  fifthQuestionsList[index].isAvailableTextField = false;
                                });
                              }
                              if(fifthQuestionsList[index].isAvailableTextField == true ){
                                secondQuestionsList[index].textFieldValue  = value;
                                print("$value");
                              }
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
                      itemCount: thirdQuestionsList.length,
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
                              labelText: thirdQuestionsList[index].name,
                              suffixIcon:InkWell(
                                  onTap: thirdQuestionsList[index].onTap,
                                  child: Image.asset("assets/images/Earphone.png")) ,
                              suffix: thirdQuestionsList[index].isAvailableTextField != null &&
                                  thirdQuestionsList[index].isAvailableTextField== true?
                              SizedBox(height: 60,width: 150 ,child: TextFormField()): const SizedBox.shrink(),


                            ),
                            initialValue: null,
                            name: 'best_language',
                            onChanged: (value){
                              print(value);
                              thirdQuestionsList[index].selectedValue =value;
                              if(value=="other" ){
                                setState(() {
                                  thirdQuestionsList[index].isAvailableTextField = true;
                                });
                              }
                              if(value!="other" && thirdQuestionsList[index].isAvailableTextField==true ){
                                setState(() {
                                  thirdQuestionsList[index].isAvailableTextField = false;
                                });
                              }
                              if(thirdQuestionsList[index].isAvailableTextField == true ){
                                thirdQuestionsList[index].textFieldValue  = value;
                                print("$value");
                              }
                            },
                            // validator: qValidator([
                            //   IsRequired(""),
                            // ]),
                            options: thirdQuestionsList[index].answersList!
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
                      itemCount: forthQuestionsList.length,
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
                              labelText: forthQuestionsList[index].name,
                              suffixIcon:InkWell(
                                  onTap: forthQuestionsList[index].onTap,
                                  child: Image.asset("assets/images/Earphone.png")) ,
                              suffix: forthQuestionsList[index].isAvailableTextField != null &&
                                  forthQuestionsList[index].isAvailableTextField== true?
                              SizedBox(height: 60,width: 150 ,child: TextFormField()): const SizedBox.shrink(),


                            ),
                            initialValue: null,
                            name: 'best_language',
                              onChanged: (value){
                                print(value);
                                forthQuestionsList[index].selectedValue =value;
                                if(value=="other" ){
                                  setState(() {
                                    forthQuestionsList[index].isAvailableTextField = true;
                                  });
                                }
                                if(value!="other" && forthQuestionsList[index].isAvailableTextField==true ){
                                  setState(() {
                                    forthQuestionsList[index].isAvailableTextField = false;
                                  });
                                }
                                if(forthQuestionsList[index].isAvailableTextField == true ){
                                  thirdQuestionsList[index].textFieldValue  = value;
                                  print("$value");
                                }
                              },
                            // validator: qValidator([
                            //   IsRequired(""),
                            // ]),
                            options: forthQuestionsList[index].answersList!
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
                              labelText: sixQuestionsList[index].name,
                              suffixIcon:InkWell(
                                  onTap: sixQuestionsList[index].onTap,
                                  child: Image.asset("assets/images/Earphone.png")) ,
                              suffix: sixQuestionsList[index].isAvailableTextField != null &&
                                  sixQuestionsList[index].isAvailableTextField== true?
                              SizedBox(height: 60,width: 150 ,child: TextFormField()): const SizedBox.shrink(),


                            ),
                            initialValue: null,
                            name: 'best_language',
                            onChanged: (value){
                              print(value);
                              sixQuestionsList[index].selectedValue =value;
                              if(value=="other" ){
                                setState(() {
                                  sixQuestionsList[index].isAvailableTextField = true;
                                });
                              }
                              if(value!="other" && sixQuestionsList[index].isAvailableTextField==true ){
                                setState(() {
                                  sixQuestionsList[index].isAvailableTextField = false;
                                });
                              }
                              if(sixQuestionsList[index].isAvailableTextField == true ){
                                sixQuestionsList[index].textFieldValue  = value;
                                print("$value");
                              }
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


