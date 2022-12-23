import 'dart:developer';
import 'dart:io';

import 'package:fijkplayer/fijkplayer.dart';
import 'package:tal3thoom/screens/widgets/better_video_widget.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/mediaButton.dart';
import '../../../../../diagnostic_service/page/views/success_page.dart';

// ignore: must_be_immutable
class SecondStageAdditionalTrainingScreen extends StatefulWidget {
  const SecondStageAdditionalTrainingScreen({Key? key}) : super(key: key);

  @override
  State<SecondStageAdditionalTrainingScreen> createState() =>
      _SecondStageAdditionalTrainingScreenState();
}

class _SecondStageAdditionalTrainingScreenState
    extends State<SecondStageAdditionalTrainingScreen> {
  final _firstController = TextEditingController();
  final FijkPlayer player = FijkPlayer();

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
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
                  child:

                      // BetterVideoItems(video:      BetterPlayer.network(
                      //   'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                      //
                      //   betterPlayerConfiguration: const BetterPlayerConfiguration(
                      //     aspectRatio: 16 / 9,
                      //   ),
                      // ),
                      //
                      //
                      //
                      //
                      // ),

                      const VideoScreen(
                    url:
                        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                  ),
                ),
                customText3(
                    title:
                        "بعد المشاهدة لمقطع الفيديو قم بالتتدريب علي هذه الامثلة : \n\n الامثلة : ",
                    color: kBlackText),
                SizedBox(
                  height: context.height * 0.02,
                ),
                buildTable(context.height, context.width,
                    color: kHomeColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                buildTable(context.height, context.width,
                    color: kAppBarColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                buildTable(context.height, context.width,
                    color: kHomeColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                buildTable(context.height, context.width,
                    color: kAppBarColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                buildTable(context.height, context.width,
                    color: kHomeColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                buildTable(context.height, context.width,
                    color: kAppBarColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                SizedBox(
                  height: context.height * 0.05,
                ),
                MediaButton(
                  onPressed: () {
                    navigateTo(
                        context,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  title: "خروج",
                ),
              ]),
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
