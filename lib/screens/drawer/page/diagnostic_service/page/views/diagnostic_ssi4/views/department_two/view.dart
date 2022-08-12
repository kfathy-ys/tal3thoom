import 'dart:developer';
import 'dart:io';

import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/success_page.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:queen/validation.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../../../config/keys.dart';
import '../../../../../../../../widgets/appBar.dart';
import '../../../../../../../../widgets/constants.dart';
import '../../../../../../../../widgets/customTextFieldToUploadFile.dart';
import '../../../../../../../../widgets/smallButtonSizer.dart';
import '../../../../../../../../widgets/smallButtonSizerUploadFile.dart';
import '../../../../../../../../widgets/video_items.dart';
import '../../../../../../../view.dart';
import '../../../resevation_diagnostic/view.dart';

// ignore: must_be_immutable
class DiagnosticSSI4Two extends StatefulWidget {
  @override
  State<DiagnosticSSI4Two> createState() => _DiagnosticSSI4TwoState();
}

class _DiagnosticSSI4TwoState extends State<DiagnosticSSI4Two> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final _firstController = TextEditingController();

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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: height,
        width: width ,
        color: kHomeColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTileContainer(
                  widthh: width * 0.5,
                  title: KeysConfig.definationDiag ,
                  context: context),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/images/Fourth test1.png"),
              ),



              SizedBox(
                width: width*0.8,
                height: height*0.25,
                child: VideoItems(
                  videoPlayerController: VideoPlayerController.network(
                    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                child: Image.asset("assets/images/talks.png"),
              ),
              InkWell(
                  onTap: () {
                    speech.speak(KeysConfig.ssFourWord2);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.asset("assets/images/Earphone.png"),
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: width*0.8,
                height: height*0.25,
                child: VideoItems(
                  videoPlayerController: VideoPlayerController.network(
                    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                  ),
                ),
              ),

              uploadedVideo(
                height: height * 0.18,
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
                  navigateTo(context, SuccessView(title1: "لقد تم إنتهاء إختبار SSI-4 بنجاح",title2: "إنتقال إلي حجز موعد",
                    onTap: ()=>navigateTo(context, ReservationDiagnostic()),));
                },
                title: KeysConfig.next ,
              ),
              buildSizedBox(height),
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
      SmallButtonSizerUploadFile(
        title: "Browse",
        onPressed: onPressed1,
        color: kTextFieldColor,
        image: "assets/images/eye.png",
      ),
    ],
  );
}
  SizedBox buildSizedBox(double height) => SizedBox(
    height: height * 0.05,
  );

