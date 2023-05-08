import 'dart:io';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/success_page.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen/validation.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../../../../config/keys.dart';
import '../../../../../../../../../widgets/alerts.dart';
import '../../../../../../../../../widgets/appBar.dart';
import '../../../../../../../../../widgets/camera_page.dart';
import '../../../../../../../../../widgets/constants.dart';
import '../../../../../../../../../widgets/loading.dart';
import '../../../../../../../../../widgets/record_video_button.dart';
import '../../../../../../../../../widgets/video_items.dart';
import '../../../../../../../../view.dart';
import '../../../../../../../diagnostic_service/page/views/diagnostic_ssi4/views/department_one/views/upload_video.dart';
import '../../../../../../../diagnostic_service/page/views/diagnostic_ssi4/views/department_two/view/questions_card.dart';
import '../../../second_stage_resevation/view.dart';
import 'cubit/second_stage_ssi4_two_dart_cubit.dart';

// ignore: must_be_immutable
class SecondTreatmentSSI4Two extends StatefulWidget {
  const SecondTreatmentSSI4Two({Key? key}) : super(key: key);

  @override
  State<SecondTreatmentSSI4Two> createState() => _SecondTreatmentSSI4TwoState();
}

class _SecondTreatmentSSI4TwoState extends State<SecondTreatmentSSI4Two> {
  final _firstController = TextEditingController();
  final FijkPlayer player = FijkPlayer();

  @override
  void dispose() {
    super.dispose();
    player.release();
    _disposeVideoController();
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
        child: BlocConsumer<SecondStageSsi4TwoDartCubit,
            SecondStageSsi4TwoDartState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<SecondStageSsi4TwoDartCubit>(context);
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                if (state is SecondStageSsi4TwoDartLoading) {
                  return const Center(
                    child: LoadingFadingCircle(),
                  );
                }
                if (state is SecondStageSsi4TwoDartSuccess) {
                  List<String> listOfString = [];
                  dynamic allString = cubit.questionList[1].hint;
                  listOfString = [allString];
                  listOfString = allString.split(";;");
                  print(
                      "***************************************************************");

                  print(listOfString);
                  print(
                      "***************************************************************");
                  String joinedString = '';

                  for (int i = 0; i < listOfString.length; i++) {
                    joinedString += '\n${i + 1} ' + listOfString[i];
                    if (i < listOfString.length - 1) {
                      joinedString += ', ';
                    }
                  }
                  print(joinedString);
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTileContainer(
                            widthh: context.width * 0.5,
                            title: KeysConfig.definationDiag,
                            context: context),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset("assets/images/SSI4 02.png"),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12),
                          child: Image.asset("assets/images/secand_class.png"),
                        ),

                        SizedBox(
                          height: context.height * 0.75,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listOfString.length,
                              itemBuilder: (context, index) {
                                return CardQuestions(
                                    index: index + 1,
                                    desc: listOfString[index]);
                              }),
                        ),
                        //  CardQuestions(index: "0", desc:  parseHtmlString(state.ssi4QuestionModel[1].description.trArgs(["01"]))),
                        // customText4(title: allString, color: kBlackText),
                        InkWell(
                            onTap: () async {
                              if (await Permission.microphone
                                  .request()
                                  .isGranted) {
                                speech.speak(parseHtmlString("السؤال الأول" +
                                    listOfString[0] +
                                    "السؤال الثاني" +
                                    listOfString[1] +
                                    "السؤال الثالث" +
                                    listOfString[2] +
                                    "السؤال الرابع" +
                                    listOfString[3] +
                                    "السؤال الخامس" +
                                    listOfString[4]));
                              } else {
                                Alert.error(
                                    "يجب الحصول علي تصريح الوصول الي الميكروفون");
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Image.asset("assets/images/Earphone.png"),
                            )),

                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
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
                              :

                              // BetterVideoItems(video:      BetterPlayer.file(
                              //   "${File(_file!.path)}",
                              //   betterPlayerConfiguration: const BetterPlayerConfiguration(
                              //     aspectRatio: 16 / 9,
                              //   ),
                              // ),
                              //
                              //
                              //
                              //
                              // ),

                              VideoItems(
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
                            if (await Permission.storage.request().isGranted) {
                              pickVideo();
                            } else {
                              Alert.error(
                                  "يجب الحصول علي تصريح الوصول الي الخزينة");
                            }
                          },
                          validator:
                              qValidator([IsRequired("thisFieldRequired")]),
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
                                text: joinedString,
                                  ));
                            } else {
                              Alert.error(
                                  "يجب الحصول علي تصريح الوصول الي الكاميرا");
                            }
                          },
                        ),
                        ScrollText(title: '  -  يرجى إعادة تسجيل الفيديو بالضغط على الزر أعلاه مرة أخرى عند عدم قناعتك بالفيديو الذي قمت بتسجيله     ...    '),


                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset("assets/images/record.png"),
                        ),

                        //const AlertVideoMessage(),

                        state is! SecondStageSsi4TwoDartLoading
                            ? MediaButton(
                                onPressed: () {
                                  _file == null
                                      ? Alert.error(' الفيديو المسجل مطلوب',
                                          desc:
                                              "الرجاء اتباع التعلميات المقدمة طبقا للمرحلة العلاجية")
                                      : Get.off(() {
                                          cubit
                                              .postUploadVideosSSI4TwoSecondStage(
                                                  id: state
                                                      .ssi4QuestionModel[1].id,
                                                  examId: state
                                                      .ssi4QuestionModel[1]
                                                      .examId,
                                                  video: _file);
                                          return SuccessView(
                                              title1:
                                                  "لقد تم إنتهاء إختبار SSI-4 بنجاح",
                                              title2: "إنتقال إلي حجز موعد",
                                              onTap: () => Get.off(() =>
                                                  SecondStageTreatmentReservation()));
                                        });
                                },
                                title: KeysConfig.next,
                              )
                            : const LoadingFadingCircle(),
                        buildSizedBox(context.height),
                      ],
                    ),
                  );
                }
                if (state is SecondStageSsi4TwoDartError) {
                  return Text(state.msg);
                }
                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }

  dynamic video;

  XFile? _file;


  void pickVideo() async {

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
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(false);
      await controller.pause();
      //await controller.play();


      setState(() {});
    }
  }
}

SizedBox buildSizedBox(double height) => SizedBox(
      height: height * 0.05,
    );
