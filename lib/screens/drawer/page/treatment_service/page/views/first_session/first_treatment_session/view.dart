import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/customButton.dart';
import '../../../../../../../widgets/video_items.dart';
import '../../../../../../view.dart';
import '../sloki/view.dart';

// ignore: must_be_immutable
class FirstTreatmentSession extends StatefulWidget {
  const FirstTreatmentSession({Key? key}) : super(key: key);

  @override
  State<FirstTreatmentSession> createState() => _FirstTreatmentSessionState();
}

class _FirstTreatmentSessionState extends State<FirstTreatmentSession> {
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
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTileContainer(
                    widthh: context.width / 1.8,
                    title: "الجلسة العلاجية الأولي",
                    context: context),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                  child: Image.asset(
                    "assets/images/marfi.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: context.width * 0.8,
                  height: context.height * 0.25,
                  child: VideoItems(
                    videoPlayerController: VideoPlayerController.network(
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    ),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: firstQuestionsList.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: context.width * 0.1,
                                height: context.height * 0.14,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                    color: kPrimaryColor),
                                child: Center(
                                  child: customText3(
                                      title: "$index", color: kHomeColor),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                width: context.width * 0.8,
                                height: context.height * 0.14,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      topLeft: Radius.circular(8),
                                    ),
                                    color: kBackgroundButton),
                                child: FormBuilder(
                                  onChanged: () {
                                    // _formKey.currentState!.save();
                                    // debugPrint(_formKey.currentState!.value.toString());
                                  },
                                  autovalidateMode: AutovalidateMode.always,
                                  child: FormBuilderRadioGroup<dynamic>(
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: kBlackText,
                                          fontSize: 18,
                                          fontFamily: 'DinBold'),
                                      labelText: firstQuestionsList[index].name,
                                    ),
                                    initialValue: null,
                                    name: 'best_language',

                                    onChanged: (value) {
                                      print(value);
                                      firstQuestionsList[index].selectedValue =
                                          value;
                                      if (value == "other") {
                                        setState(() {
                                          firstQuestionsList[index]
                                              .isAvailableTextField = true;
                                        });
                                      }
                                      if (value != "other" &&
                                          firstQuestionsList[index]
                                                  .isAvailableTextField ==
                                              true) {
                                        setState(() {
                                          firstQuestionsList[index]
                                              .isAvailableTextField = false;
                                        });
                                      }
                                      if (firstQuestionsList[index]
                                              .isAvailableTextField ==
                                          true) {
                                        firstQuestionsList[index]
                                            .textFieldValue = value;
                                        print("$value");
                                      }
                                    },
                                    // validator:  (value) => value.isEmpty ? KeysConfig.thisFieldRequired :null,
                                    options: firstQuestionsList[index]
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
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            width: context.width * 0.8,
                            height: context.height * 0.25,
                            child: VideoItems(
                              videoPlayerController:
                                  VideoPlayerController.network(
                                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
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
                    navigateTo(context, const SlokiScreen());
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
