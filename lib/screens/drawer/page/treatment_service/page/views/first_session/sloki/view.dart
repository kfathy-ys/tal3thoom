import 'dart:developer';
import 'dart:io';

import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/sloki/views/build_three.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/customButton.dart';
import '../../../../../../../widgets/video_items.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/diagnostic_ssi4/views/department_one/views/upload_video.dart';
import '../evaluation_section/view.dart';

// ignore: must_be_immutable
class SlokiScreen extends StatefulWidget {
  const SlokiScreen({Key? key}) : super(key: key);

  @override
  State<SlokiScreen> createState() => _SlokiScreenState();
}

class _SlokiScreenState extends State<SlokiScreen> {
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
                    title: "الجلسة العلاجية الأولي",
                    context: context),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                  child: Image.asset(
                    "assets/images/sloky.png",
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
                CardUploadVideo(
                  height: context.height * 0.18,
                  title: "fullMessage",
                  controller: _firstController,
                  onPressed1: () {
                    _uploadFile(1);
                  },
                  validator: qValidator([IsRequired("thisFieldRequired")]),
                  context: context,
                ),
                SizedBox(
                  height: context.height * 0.05,
                ),
                const BuildTable(
                    color: kHomeColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                const BuildTable(
                    color: kAppBarColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                const BuildTable(
                    color: kHomeColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                SizedBox(
                  height: context.height * 0.05,
                ),
                CustomButton(
                  color: kPrimaryColor,
                  title: "متابعة",
                  onPressed: () {
                    navigateTo(context, EvaluationSectionScreen());
                  },
                ),
              ]),
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
