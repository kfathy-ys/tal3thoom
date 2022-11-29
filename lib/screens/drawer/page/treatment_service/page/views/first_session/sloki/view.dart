import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide Trans, ContextExtensionss;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../widgets/alerts.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../../widgets/video_items.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/diagnostic_ssi4/views/department_one/views/upload_video.dart';
import '../evaluation_section/cubit/evaluation_cubit.dart';
import '../evaluation_section/view.dart';
import 'cubit/behavioral_cubit.dart';

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
          child: BlocConsumer<BehavioralCubit, BehavioralState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              final cubit = BlocProvider.of<BehavioralCubit>(context);

              if (state is BehavioralLoading) {
                return const Center(
                  child: LoadingFadingCircle(),
                );
              }
              if (state is BehavioralSuccess) {
                List<String> listOfString = [];
                dynamic allString = state.behavioralSection[0].hint.toString();
                listOfString = [allString];
                listOfString = allString.split(";;");
                print(
                    "***************************************************************");

                print(listOfString);
                print(
                    "***************************************************************");
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTileContainer(
                          widthh: context.width / 1.8,
                          title: "الجلسة العلاجية " +
                              state.behavioralSection[0].tags.toString(),
                          context: context),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4),
                        child: Image.asset(
                          "assets/images/sloky.png",
                        ),
                      ),

                      state.behavioralSection[0].videoFile == null
                          ? const SizedBox.shrink()
                          : Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              width: context.width * 0.8,
                              height: context.height * 0.25,
                              child: VideoItems(
                                videoPlayerController:
                                    VideoPlayerController.network(
                                  "http://dev-sas.cpt-it.com/api/" +
                                      state.behavioralSection[0].videoFile,
                                ),
                              ),
                            ),





                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: context.width * 0.8,
                        height: context.height * 0.25,
                        child: SizedBox(
                          width: context.width * 0.8,
                          height: context.height * 0.25,
                          child: _file == null
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: kBlackText,
                                      border: Border.all(
                                          color: kPrimaryColor, width: 3)
                                      // : BorderRadius.circular(4)
                                      ),
                                )
                              : VideoItems(
                                  videoPlayerController:
                                      VideoPlayerController.file(
                                    File(_file!.path ),
                                  ),
                                ),
                        ),
                      ),
                      CardUploadVideo(
                        height: context.height * 0.18,
                        title: "fullMessage",
                        controller: _firstController,
                        onPressed1: () {
                          pickVideo();
                        },
                        validator:
                            qValidator([IsRequired("thisFieldRequired")]),
                        context: context,
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      state.behavioralSection[0].hint==null? const SizedBox.shrink():


                      SizedBox(
                          height: context.height * 0.08,
                          child:  ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listOfString.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: kSkyLightColor,

                                      borderRadius: BorderRadius.circular(8)                                ),
                                  margin: const EdgeInsets.symmetric(horizontal:4,),
                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                  height: context.height * 0.08,

                                  child: Center(
                                    child: customText4(title:listOfString[index] , color: kBlackText),
                                  ),

                                );
                              }
                          )),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      state is! BehavioralLoading
                          ? MediaButton(
                              onPressed: () {
                                BlocProvider.of<BehavioralCubit>(context)
                                    .getBehavioralSection();

                                _file == null
                                    ? Alert.error(' الفيديو المسجل مطلوب',
                                        desc:
                                            "الرجاء اتباع التعلميات المقدمة طبقا للمرحلة العلاجية")
                                    : "";
                                cubit.postUploadVideo(
                                    questionId: state.behavioralSection[0].id,
                                    examId: state.behavioralSection[0].examId,
                                    video: _file);
                                BlocProvider.of<EvaluationCubit>(context).getEvaluationSection();

                                Get.to(() =>  EvaluationSectionScreen());



                              },
                              title: "متابعة",
                            )
                          : const LoadingFadingCircle(),
                    ]);
              }
              if (state is BehavioralError) {
                return Text(state.msg);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  File? _file1;

  dynamic video;

  XFile? _file;

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
}
