// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
  bool _isPaused = false;
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
  late Timer _timer;
  int _secondsElapsed = 0;

  String get _timerString {
    int minutes = _secondsElapsed ~/ 60;
    int seconds = _secondsElapsed % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
    _secondsElapsed = 0;
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
      _stopTimer();
      setState(() => _isRecording = false);

      widget.onAdd(file);
      Navigator.pop(context);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      _startTimer();
      setState(() => _isRecording = true);
      Future.delayed(const Duration(minutes: 3), () {
        _stopRecordVideo();

       //TODO:: The Client wanted to disable the validation of video size
       // Alert.error("الفيديو المطلوب تعدي عدد الميغا بايت المطلوبة ");
      });
    }
  }

  String _formatTime(int seconds) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds ~/ 60) % 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$secs';
  }
  _pauseRecordVideo() {
    if (_isRecording && !_isPaused) {
      _cameraController.pauseVideoRecording();
      setState(() => _isPaused = true);
    } else if (_isRecording && _isPaused) {
      _cameraController.resumeVideoRecording();
      setState(() => _isPaused = false);
    }
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
          if(widget.text != null)  Card(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: SizedBox(
                  height: context.height*0.25,
                  width: context.width*0.94,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      child: AutoSizeText(
                        minFontSize: 12,
                        maxFontSize: 12,
                       // maxLines: 10,

                        "( عند تسجيلك للفيديو يرجى أن تكون صورتك في وسط الشاشة )\n"+  widget.text! ,style: const TextStyle(color: kHomeColor,  fontFamily: 'DinMedium'),

                      ),
                    ),
                  ),



                ),
              ),
            ),
           // FloatingActionButton(
             // backgroundColor: Colors.red,
              // child: Icon(_isRecording ? Icons.stop : Icons.circle),
              // onPressed: () {
              //   _stopRecordVideo();
              // },


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(backgroundColor: Colors.transparent,
                    onPressed: _stopRecordVideo, // replace with your function
                    child:_isRecording ?
                    Lottie.asset(
                      'assets/lottie/Comp 1.json', // replace with your file path
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                      animate: true,
                    ):Lottie.asset(
                      'assets/lottie/start_Recording.json', // replace with your file path
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                      animate: true,
                    )
                  ),
                // FloatingActionButton(
                //   backgroundColor: Colors.red,
                //   child: Icon(
                //       _isPaused ? Icons.play_arrow : Icons.pause),
                //   onPressed: () {
                //     _pauseRecordVideo();
                //   },
                // ),
                Card(
                  color: Colors.transparent,
                  child: Container(
                    margin:  EdgeInsets.only(bottom: context.height*0.02),
                    child: Text(
                      ' $_timerString',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),

           // ),
          ],
        ),



      );
    }
  }
}
