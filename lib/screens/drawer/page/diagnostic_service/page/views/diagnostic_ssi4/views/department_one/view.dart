import 'dart:io';
import 'dart:math';
import 'package:get/get.dart' hide Trans, ContextExtensionss;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:queen/queen.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_ssi4/views/department_one/views/upload_video.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/loading.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import '../../../../../../../../../config/keys.dart';

import '../../../../../../../../widgets/alerts.dart';
import '../../../../../../../../widgets/appBar.dart';
import '../../../../../../../../widgets/camera_page.dart';
import '../../../../../../../../widgets/constants.dart';
import '../../../../../../../../widgets/record_video_button.dart';
import '../../../../../../../../widgets/video_items.dart';
import '../../../../../../../view.dart';
import '../../cubit/diagnostic_ssi4_first_cubit.dart';
import '../department_two/view.dart';
import 'views/alert_vedio_size.dart';

// ignore: must_be_immutable
class DiagnosticSSI4 extends StatefulWidget {
  const DiagnosticSSI4({super.key});

  @override
  State<DiagnosticSSI4> createState() => _DiagnosticSSI4State();
}

class _DiagnosticSSI4State extends State<DiagnosticSSI4> {
  final _firstController = TextEditingController();

  @override
  void dispose() {
    _disposeVideoController();
    super.dispose();
  }

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
        child: BlocConsumer<DiagnosticSsi4FirstCubit, DiagnosticSsi4FirstState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<DiagnosticSsi4FirstCubit>(context);

            if (state is DiagnosticSsi4FirstLoading) {
              return const Center(
                child: LoadingFadingCircle(),
              );
            }
            if (state is DiagnosticSsi4FirstSuccess) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTileContainer(
                              title: "أختبار SSI-4 ",
                              widthh: context.width * 0.5,
                              context: context),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:
                                Image.asset("assets/images/Fourth test1.png"),
                          ),
                          SizedBox(
                            width: context.width * 0.8,
                            height: context.height * 0.25,
                            child: VideoItems(
                              videoPlayerController:
                                  VideoPlayerController.network(
                                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset("assets/images/first_class.png"),
                          ),
                          customText4(
                              title: parseHtmlString(
                                  state.ssi4QuestionModel[0].description),
                              color: kBlackText),
                          InkWell(
                              onTap: () async {
                                if (await Permission.microphone
                                    .request()
                                    .isGranted) {
                                  speech.speak(parseHtmlString(
                                      state.ssi4QuestionModel[0].description));
                                } else {
                                  Alert.error(
                                      "يجب الحصول علي تصريح الوصول الي الميكروفون");
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child:
                                    Image.asset("assets/images/Earphone.png"),
                              )),
                          SizedBox(
                            width: context.width * 0.8,
                            height: context.height * 0.25,
                            child: _file == null
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: kBlackText,
                                        border: Border.all(
                                            color: kPrimaryColor, width: 3)),
                                  )
                                : VideoItems(
                                    videoPlayerController:
                                        VideoPlayerController.file(
                                            File(_file!.path)),
                                  ),
                          ),
                          CardUploadVideo(
                            height: context.height * 0.18,
                            title: "fullMessage",
                            controller: _firstController,
                            onPressed1: () async {
                              if (await Permission.storage
                                  .request()
                                  .isGranted) {
                                pickVideo();
                              } else {
                                Alert.error(
                                    "يجب الحصول علي تصريح الوصول الي الخزينة");
                              }
                            },
                            validator: qValidator(
                                [IsRequired(KeysConfig.thisFieldRequired)]),
                            context: context,
                          ),
                          SmallButtonSizerRecordVideo(
                            onPressed: () async {
                              if (await Permission.camera.request().isGranted) {
                                Get.to(() => CameraPage(
                                      onAdd: (x) {
                                        setState(() {
                                          _file = x;

                                        });

                                      },

                                ));

                              } else {
                                Alert.error(
                                    "يجب الحصول علي تصريح الوصول الي الكاميرا");
                              }
                            },
                          ),
                          const AlertVideoMessage(),
                          state is! DiagnosticSsi4FirstLoading
                              ? MediaButton(
                                  onPressed: () {
                                    _file == null
                                        ? Alert.error(' الفيديو المسجل مطلوب',
                                            desc:
                                                "الرجاء اتباع التعلميات المقدمة طبقا للمرحلة العلاجية")
                                        : Get.off(() {
                                            cubit.postUploadVideoSSI4(
                                                id: state
                                                    .ssi4QuestionModel[0].id,
                                                examId: state
                                                    .ssi4QuestionModel[0]
                                                    .examId,
                                                video: _file);

                                            return DiagnosticSSI4Two();
                                          });
                                  },
                                  title: "متابعة",
                                )
                              : const LoadingFadingCircle(),
                          buildSizedBox(context.height),
                        ],
                      ),
                    );
                  });
            }
            if (state is DiagnosticSsi4FirstError) {
              return Text(state.msg);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  dynamic video;

  XFile? _file;

/*
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
*/

  void pickVideo() async {
    _picker.pickVideo(source: ImageSource.gallery).then((value) {
      if (value != null) {
        setState(() {
          _file = value;
        });
        _playVideo(value);
      }
    });
  }

  bool isVideo = false;
  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(false);
      await controller.play();
      setState(() {});
    }
  }
  Future<dynamic>getFileSize(dynamic filepath, int decimals) async {
    var file = File(filepath) ;
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
// void _uploadVideo() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: [
//       "MP4",
//       "MOV",
//       "WMV",
//       "AVI",
//       "AVCHD",
//       "FLV",
//       "F4V",
//       "SWF",
//       "MKV",
//       "WEBM",
//       "HTML5"
//     ],
//   );
//
//   if (result != null) {
//     File file = File(result.files.single.path!);
//     print("-=-=-=-=- selected file is ${file.toString()}");
//     setState(() {
//       _file1 = file;
//       //_inputData.video = file;
//       _firstController.text = file.path;
//     });
//   } else {
//     // User canceled the picker
//   }
// }
//
//
// Widget selectVideosStaticContainer(BuildContext context, VoidCallback onTap,
//     bool isNull) {
//   return Column(
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Align(
//             alignment: Alignment.centerRight,
//             child: Text(isNull
//                 ? "Auctions_YouCanAddVideo"
//                 : context.locale.languageCode == "en"
//                 ? "Video uploaded successfully"
//                 : "تم رفع الفيديو بنجاح")
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(bottom: 40),
//         child: InkWell(
//           onTap: onTap,
//           child: const Center(
//               child: Icon(
//                 Icons.video_collection_rounded,
//                 size: 30,
//               )),
//         ),
//       ),
//     ],
//   );
// }
}

SizedBox buildSizedBox(double height) => SizedBox(
      height: height * 0.05,
    );
