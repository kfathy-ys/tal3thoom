
import 'package:tal3thoom/screens/drawer/page/previous_treatment_sessions/views/drop_down_result_sessions.dart';
import 'package:tal3thoom/screens/home/view.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:video_player/video_player.dart';

import '../../../widgets/appBar.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/video_items.dart';
import '../../view.dart';
import '../diagnostic_service/page/views/question.dart';

// ignore: must_be_immutable
class ResultsPreviousTreatmentSessions extends StatefulWidget {
  @override
  State<ResultsPreviousTreatmentSessions> createState() => _ResultsPreviousTreatmentSessionsState();
}

class _ResultsPreviousTreatmentSessionsState extends State<ResultsPreviousTreatmentSessions> {
   var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: () => scaffoldKey.currentState!.openDrawer()),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: height,
        width: width,
        color: kHomeColor,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: CustomTileContainer(
                    widthh: width / 1.5,
                    title: "نتائج الجلسات العلاجية السابقة",
                    context: context),
              ),

               Center(child: customText7(title: "أختر نتيجة الجلسة العلاجية", color: kBlackText)),
              const Center(child: DropDownListResultSessions()),

              answerQuestiontitle(title:  "القسم الأول : \t",subtitle: "معرفي"),
              answerQuestiontitle(title:  "الإجابات الصحيحة مظللة بالون :\t",subtitle: "الأزرق"),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: width*0.8,
                  height: height*0.25,

                  child: VideoItems(
                    videoPlayerController: VideoPlayerController.network(
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height*0.4,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: firstQuestionsList.length,
                  itemBuilder: (context ,index){
                    return Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Container(
                            width: width*0.1,
                            height: height*0.14,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight:Radius.circular(8),topRight:Radius.circular(8),),
                                color: kPrimaryColor

                            ),
                            child: Center(
                              child: customText3(title: "$index", color: kHomeColor),
                            ),),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                            width: width*0.8,
                            height: height*0.14,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(8),topLeft:Radius.circular(8),),

                                color: kBackgroundButton
                            ),
                            child: FormBuilder(

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



                            ),
                          ),
                        ],
                      ),
                    );

                  },

                ),
              ),
              answerQuestiontitle(title:  "القسم الثاني : \t",subtitle: "سلوكي"),
              answerQuestiontitle(title:  "الإجابات الصحيحة مظللة بالون :\t",subtitle: "الأزرق"),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: width*0.8,
                  height: height*0.25,

                  child: VideoItems(
                    videoPlayerController: VideoPlayerController.network(
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height*0.4,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: firstQuestionsList.length,
                  itemBuilder: (context ,index){
                    return Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Container(
                            width: width*0.1,
                            height: height*0.14,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight:Radius.circular(8),topRight:Radius.circular(8),),
                                color: kPrimaryColor

                            ),
                            child: Center(
                              child: customText3(title: "$index", color: kHomeColor),
                            ),),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                            width: width*0.8,
                            height: height*0.14,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(8),topLeft:Radius.circular(8),),

                                color: kBackgroundButton
                            ),
                            child: FormBuilder(

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



                            ),
                          ),
                        ],
                      ),
                    );

                  },

                ),
              ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                 child: Center(
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kPrimaryColor,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),)
                             ),
                             child: Center(
                               child: customText10(title: "عدد أسئلة القسم المعرفى", color: kHomeColor),
                             ),
                           ),
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kAppBarColor,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),)
                             ),
                             child: Center(
                               child: customText3(title: "1", color: kBlackText),
                             ),
                           )
                         ],
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kPrimaryColor,
                             ),
                             child: Center(
                               child: customText10(title: "الإجابات الصحيحة", color: kHomeColor),
                             ),
                           ),
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kAppBarColor,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),)
                             ),
                             child: Center(
                               child: customText3(title: "2", color: kBlackText),
                             ),
                           )
                         ],
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kPrimaryColor,
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft:  Radius.circular(8),)
                             ),
                             child: Center(
                               child: customText10(title: "عرض الفيديو الخاص بالمريض (القسم السلوكى )", color: kHomeColor),
                             ),
                           ),
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kAppBarColor,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),)
                             ),
                             child: Center(
                               child: InkWell(
                                 onTap: (){},
                                 child: Container(
                                     width: width*0.1,
                                     height: height*0.05,

                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8),
                                       color: kButtonGreenDark,
                                     ),
                                     child: Image.asset("assets/images/eye.png")),
                               ),
                             ),
                           )
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                 child: Center(
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kPrimaryColor,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),)
                             ),
                             child: Center(
                               child: customText10(title: "التقيمات", color: kHomeColor),
                             ),
                           ),
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kAppBarColor,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),)
                             ),
                             child: Center(
                               child: customText3(title: "تقييم المستوى فى الجلسة الحالية", color: kBlackText),
                             ),
                           )
                         ],
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kPrimaryColor,
                             ),
                             child: Center(

                               child: customText10(title: "تقيم المريض لذاتة", color: kHomeColor),
                             ),
                           ),
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kAppBarColor,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),)
                             ),
                             child: Center(
                               child: customText3(title: "2", color: kBlackText),
                             ),
                           )
                         ],
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kPrimaryColor,
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft:  Radius.circular(8),)
                             ),
                             child: Center(
                               child: customText10(title: "تقيم الأخصائي للمريض", color: kHomeColor),
                             ),
                           ),
                           Container(
                             height: height*0.1,
                             width: width*0.3,
                             decoration: const BoxDecoration(
                                 color: kAppBarColor,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),)
                             ),
                             child: Center(
                               child: customText3(title: "2", color: kBlackText),
                             ),
                           )
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
              SmallButton(onPressed: (){
                navigateTo(context, const HomeTabScreen());
              }, title: "Skip")
            ]),
      ),
    );
  }

  Widget answerQuestiontitle({required String title  ,required String subtitle}) {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 4),
              child: Row(
                children: [
                  customText10(title:title, color: kBlackText),
                  customText10(title: subtitle, color: kPrimaryColor),

                ],
              ),
            );
  }
}