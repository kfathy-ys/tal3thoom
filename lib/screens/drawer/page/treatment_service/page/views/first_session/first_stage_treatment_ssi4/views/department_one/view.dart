import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:queen/queen.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../../../../../config/keys.dart';
import '../../../../../../../../../widgets/appBar.dart';
import '../../../../../../../../../widgets/constants.dart';
import '../../../../../../../../../widgets/video_items.dart';
import '../../../../../../../../view.dart';

import '../../../../../../../diagnostic_service/page/views/diagnostic_ssi4/views/department_one/views/upload_video.dart';
import '../department_two/view.dart';

// ignore: must_be_immutable
class TreatmentSSI4 extends StatefulWidget {
  const TreatmentSSI4({Key? key}) : super(key: key);

  @override
  State<TreatmentSSI4> createState() => _TreatmentSSI4State();
}

class _TreatmentSSI4State extends State<TreatmentSSI4> {
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
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: context.height,
        width: context.width,
        color: kHomeColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTileContainer(
                  title: KeysConfig.addComment,
                  widthh: context.width * 0.5,
                  context: context),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/images/Fourth test1.png"),
              ),

              SizedBox(
                width: context.width * 0.8,
                height: context.height * 0.25,
                child: VideoItems(
                  videoPlayerController: VideoPlayerController.network(
                    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                  ),
                ),
              ),
              // CardUploadVideo(
              //   height: context.height * 0.18,
              //   title: "fullMessage",
              //   controller: _firstController,
              //   onPressed1: () {
              //     _uploadFile(1);
              //   },
              //   validator: qValidator([IsRequired("thisFieldRequired")]),
              //   context: context,
              // ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/images/word.png"),
              ),
              InkWell(
                  onTap: () {
                    speech.speak(KeysConfig.ssFourWord);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.asset("assets/images/Earphone.png"),
                  )),
              SizedBox(
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/images/record.png"),
              ),
              MediaButton(
                onPressed: () {
                  navigateTo(
                    context,
                    const TreatmentSSI4Two(),
                  );
                },
                title: "متابعة",
              ),
              buildSizedBox(context.height),
            ],
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

SizedBox buildSizedBox(double height) => SizedBox(
      height: height * 0.05,
    );
