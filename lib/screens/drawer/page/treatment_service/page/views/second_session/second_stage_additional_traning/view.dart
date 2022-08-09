import 'dart:developer';
import 'dart:io';

import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/customTextFieldToUploadFile.dart';
import '../../../../../../../widgets/mediaButton.dart';
import '../../../../../../../widgets/smallButtonSizer.dart';
import '../../../../../../../widgets/video_items.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/success_page.dart';

// ignore: must_be_immutable
class SecondStageAdditionalTrainingScreen extends StatefulWidget {
  const SecondStageAdditionalTrainingScreen({Key? key}) : super(key: key);

  @override
  State<SecondStageAdditionalTrainingScreen> createState() => _SecondStageAdditionalTrainingScreenState();
}

class _SecondStageAdditionalTrainingScreenState extends State<SecondStageAdditionalTrainingScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _firstController = TextEditingController();

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
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTileContainer(
                    widthh: width / 1.8,
                    title: "تتدريب إضافي",
                    context: context),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: width * 0.8,
                  height: height * 0.25,
                  child: VideoItems(
                    videoPlayerController: VideoPlayerController.network(
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    ),
                  ),
                ),
                
                
                customText3(title: "بعد المشاهدة لمقطع الفيديو قم بالتتدريب علي هذه الامثلة : \n\n الامثلة : ", color: kBlackText),

                SizedBox(height: height*0.02,),
                buildTable(height, width,color: kHomeColor , title1: "مثال1" , title2: "مثال1" ,title3: "مثال1"),
                buildTable(height, width,color: kAppBarColor , title1: "مثال1" , title2: "مثال1" ,title3: "مثال1"),
                buildTable(height, width,color: kHomeColor , title1: "مثال1" , title2: "مثال1" ,title3: "مثال1"),
                buildTable(height, width,color: kHomeColor , title1: "مثال1" , title2: "مثال1" ,title3: "مثال1"),
                buildTable(height, width,color: kHomeColor , title1: "مثال1" , title2: "مثال1" ,title3: "مثال1"),
                buildTable(height, width,color: kHomeColor , title1: "مثال1" , title2: "مثال1" ,title3: "مثال1"),
                SizedBox(height: height*0.05,),
                MediaButton(

                  onPressed: () {
                    navigateTo(context, Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SuccessView(title1: "لقد اتممت الجلسة العلاجية وسيتم تحويلك إلي الجلسة التالية عن طريق المختص بعد تقييمة لنتائج الجلسة والفيديو التي قمت بارسالة",title2: "تدريب وتعليم إضافي",
                        onTap: ()=>navigateTo(context, const SecondStageAdditionalTrainingScreen()),),
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

  Widget buildTable(double height, double width,{required Color color , required String title1 , required String title2 , required String title3}) {
    return Container(
                height: height*0.059,
                width: width*0.8,

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
