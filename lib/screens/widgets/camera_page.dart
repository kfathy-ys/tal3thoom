import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tal3thoom/screens/widgets/alerts.dart';
import 'package:tal3thoom/screens/widgets/video_page.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'constants.dart';

class CameraPage extends StatefulWidget {

  final Function(XFile) onAdd;
  const CameraPage({Key? key, required this.onAdd}) : super(key: key);

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
    final front = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
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
      Future.delayed(const Duration(seconds: 10),(){
        _stopRecordVideo();
        Alert.error("الفيديو المطلوب تعدي عدد الميغا بايت المطلوبة ");

      });
    }
  }
  Future<bool>isStoped(dynamic filepath, int decimals) async {
    var file = File(filepath) ;
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
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [


            CameraPreview(_cameraController),
            Padding(
              padding: const EdgeInsets.all(25),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                child: Icon(_isRecording ? Icons.stop : Icons.circle),
                onPressed: () {
                  _stopRecordVideo();

                },
              ),
            ),
          ],
        ),
      );
    }
  }


/*  Widget _buildResendCounter() {
    return Countdown(
      seconds: 10,
      controller: _countdownController,
      onFinished: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('يجب ان يكون الفيديو 10 ثواني فقط',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                    fontSize: 12)),
          ),
        );
        _stopRecordVideo();
      },
      build: (context, time) {
        final showResetBottom = time.toInt() == 0;
        final minutes = time >= 60 ? (time / 60).round() : 0;
        final seconds = (time - minutes * 60).round();
        print(" khaled${minutes } : ${seconds}");
        return GestureDetector(
          onTap: () {
            // _handleCodeResend();
            if (showResetBottom) {
              _countdownController.restart();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "KeysConfig.resent",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: showResetBottom ? Colors.black : kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DinReguler',
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$minutes:${seconds < 10 ? 0 : ''}${seconds.toInt()}',
                  style: TextStyle(
                    color: !showResetBottom ? Colors.black : Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }*/
}