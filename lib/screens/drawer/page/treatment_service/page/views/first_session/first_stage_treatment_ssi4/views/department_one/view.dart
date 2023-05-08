import 'dart:io';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:get/get.dart' hide Trans, ContextExtensionss;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:queen/queen.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../../../../../config/keys.dart';
import '../../../../../../../../../widgets/alerts.dart';
import '../../../../../../../../../widgets/appBar.dart';
import '../../../../../../../../../widgets/camera_page.dart';
import '../../../../../../../../../widgets/constants.dart';
import '../../../../../../../../../widgets/loading.dart';
import '../../../../../../../../../widgets/record_video_button.dart';
import '../../../../../../../../../widgets/video_upload_record.dart';
import '../../../../../../../../view.dart';

import '../../../../../../../diagnostic_service/page/views/diagnostic_ssi4/views/department_one/views/upload_video.dart';
import '../department_two/view.dart';
import 'cubit/first_stage_ssi4_one_cubit.dart';

// ignore: must_be_immutable
class TreatmentSSI4 extends StatefulWidget {
  const TreatmentSSI4({Key? key}) : super(key: key);

  @override
  State<TreatmentSSI4> createState() => _TreatmentSSI4State();
}

class _TreatmentSSI4State extends State<TreatmentSSI4> {
  final _firstController = TextEditingController();
  final FijkPlayer player = FijkPlayer();

  @override
  void dispose() {
    super.dispose();
    _disposeVideoController();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
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
        child: BlocConsumer<FirstStageSsi4OneCubit, FirstStageSsi4OneState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<FirstStageSsi4OneCubit>(context);

            if (state is FirstStageSsi4OneLoading) {
              return const Center(
                child: LoadingFadingCircle(),
              );
            }
            if (state is FirstStageSsi4OneSuccess) {
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
                                Image.asset("assets/images/SSI4 01.png"),
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
                                    //padding: EdgeInsets.symmetric(vertical: 4,),
                                    decoration: BoxDecoration(
                                        color: kBlackText,
                                        border: Border.all(
                                            color: kPrimaryColor, width: 3)
                                        // borderRadius: BorderRadius.circular(4)
                                        ),
                                  )
                                :VideoUploadRecordScreen(url:_file!.path.toString() ,)

                                // VideoItems(
                                //     videoPlayerController:
                                //         VideoPlayerController.file(
                                //             File(_file!.path)),
                                //   ),
                          ),
                          CardUploadVideo(
                            height: context.height * 0.18,
                            title: "fullMessage",
                            controller: _firstController,
                            onPressed1: () async {
                              if (await Permission.storage
                                  .request()
                                  .isGranted) {
                                _pickVideo();
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
                                setState(() {
                                  _file = null;
                                  _controller?.dispose();
                                });

                                Get.to(() => CameraPage(
                                      onAdd: (x) {
                                        setState(() {
                                          _file = x;
                                          print("File = Recorded => "+_file!.path.toString());

                                        });
                                      },
                                  text:   parseHtmlString(
                                      state.ssi4QuestionModel[0].description),

                                    ));
                              } else {
                                Alert.error(
                                    "يجب الحصول علي تصريح الوصول الي الكاميرا");
                              }
                            },
                          ),
                          //const AlertVideoMessage(),
                          ScrollText(title: '  -  يرجى إعادة تسجيل الفيديو بالضغط على الزر أعلاه مرة أخرى عند عدم قناعتك بالفيديو الذي قمت بتسجيله     ...    '),

                          state is! FirstStageSsi4OneLoading
                              ? MediaButton(
                                  onPressed: () {
                                    _file == null
                                        ? Alert.error(' الفيديو المسجل مطلوب',
                                            desc:
                                                "الرجاء اتباع التعلميات المقدمة طبقا للمرحلة العلاجية")
                                        : Get.off(() {
                                            cubit.postUploadVideoSSI4FirstStage(
                                                id: state
                                                    .ssi4QuestionModel[0].id,
                                                examId: state
                                                    .ssi4QuestionModel[0]
                                                    .examId,
                                                video: _file);

                                            return const TreatmentSSI4Two();
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
            if (state is FirstStageSsi4OneError) {
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

  void _pickVideo() async {

    setState(() {
      _file = null;
      _controller?.dispose();
    });
    _picker.pickVideo(source: ImageSource.gallery).then((value) {
      if (value != null) {

        final file = File(value.path);
        print("File = "+file.path.toString());
        if (file.existsSync()) {
          final fileLength = file.lengthSync();
          if (fileLength > 150 * 1024 * 1024) {
            Alert.error("هذا الفيديو كبير جدًا. الرجاء تحديد مقطع فيديو بحجم أقل.");
          } else {
            setState(() {
              _file = value;
            });
            _playVideo(value);

          }
        } else {
          Alert.error("لم يتم العثور على الملف.");
        }
      }
    }).catchError((error) {
      Alert.error("خطأ في اختيار الفيديو: $error");
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
        controller = VideoPlayerController.network(file.path,);
      } else {
        controller = VideoPlayerController.file(
          File(file.path),
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),

        );
      }
      _controller = controller;

      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(false);
      await controller.pause();
      //await controller.play();


      setState(() {});
    }
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
