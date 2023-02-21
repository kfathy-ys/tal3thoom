import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';

import 'constants.dart';
import 'loading.dart';

class CameraPage extends StatefulWidget {
  final Function(XFile) onAdd;
  String? text;
   CameraPage({Key? key, required this.onAdd,this.text}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _isLoading = true;
  bool _isRecording = false;
  late CameraController _cameraController;

  final _pinController = TextEditingController();
  final CountdownController _countdownController =
      CountdownController(autoStart: false);

  void _handleConfirmCode() {
    final text = _pinController.text;
    if (text.isNotEmpty) {
      // ConfirmCodeCubit.of(context).checkCode(_pinFieldController.text);
    }
  }

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.low);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  _stopRecordVideo() async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);

      widget.onAdd(file);
      Navigator.pop(context);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();

      setState(() => _isRecording = true);
      Future.delayed(const Duration(minutes: 3), () {
        _stopRecordVideo();

       //TODO:: The Client wanted to disable the validation of video size
       // Alert.error("الفيديو المطلوب تعدي عدد الميغا بايت المطلوبة ");
      });
    }
  }

  Future<bool> isStoped(dynamic filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes >= 2040) {
      return true;
    } else {
      return false;
    }
    // const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    // var i = (log(bytes) / log(1024)).floor();
    // return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: LoadingFadingCircle(),
        ),
      );
    } else {
      return Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            CameraPreview(_cameraController),
          if(widget.text == null)  Card(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: SizedBox(
                  height: context.height*0.25,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                    child: Text(


                      widget.text! ,style: const TextStyle(color: kHomeColor,fontSize: 12,  fontFamily: 'DinMedium'),

                    ),
                  ),



                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(_isRecording ? Icons.stop : Icons.circle),
              onPressed: () {
                _stopRecordVideo();
              },
            ),
          ],
        ),
      );
    }
  }
}
