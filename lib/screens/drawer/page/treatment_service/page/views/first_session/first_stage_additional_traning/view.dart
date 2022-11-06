
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/mediaButton.dart';
import '../../../../../../../widgets/video_items.dart';
import '../../../../../../view.dart';
import '../first_cognitive_session/cubit/cognitive_section_cubit.dart';

// ignore: must_be_immutable
class FirstStageAdditionalTrainingScreen extends StatefulWidget {
  const FirstStageAdditionalTrainingScreen({Key? key}) : super(key: key);

  @override
  State<FirstStageAdditionalTrainingScreen> createState() =>
      _FirstStageAdditionalTrainingScreenState();
}

class _FirstStageAdditionalTrainingScreenState
    extends State<FirstStageAdditionalTrainingScreen> {
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
                    title: "تتدريب إضافي",
                    context: context),
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
                customText3(
                    title:
                        "بعد المشاهدة لمقطع الفيديو قم بالتتدريب علي هذه الامثلة : \n\n الامثلة : ",
                    color: kBlackText),
                SizedBox(
                  height: context.height * 0.02,
                ),
                SizedBox(
                  height: context.height * 0.3,
                  child: Image.asset("assets/images/t1.jpeg"),
                ), SizedBox(
                  height: context.height * 0.25,
                  child: Image.asset("assets/images/t2.jpeg"),
                ),

                SizedBox(
                  height: context.height * 0.05,
                ),
                MediaButton(
                  onPressed: () {
                 BlocProvider.of<CognitiveSectionCubit>(context).getCognitiveSection();

                  },
                  color: kPrimaryColor,
                  title: "خروج",
                ),
              ]),
        ),
      ),
    );
  }


}
