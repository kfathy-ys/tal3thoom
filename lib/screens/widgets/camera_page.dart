// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:tal3thoom/screens/widgets/video_items.dart';
//
// class CameraPage extends StatefulWidget {
//    CameraPage({Key? key}) : super(key: key);
//
//   @override
//   _CameraPageState createState() => _CameraPageState();
// }
//
// class _CameraPageState extends State<CameraPage> {
//   bool _isLoading = true;
//   bool _isRecording = false;
//   late CameraController _cameraController;
//
//   @override
//   void initState() {
//     _initCamera();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
//   }
//
//   _initCamera() async {
//     final cameras = await availableCameras();
//     final front = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
//     _cameraController = CameraController(front, ResolutionPreset.low);
//     await _cameraController.initialize();
//     setState(() => _isLoading = false);
//   }
//
//   _recordVideo() async {
//     if (_isRecording) {
//       final file = await _cameraController.stopVideoRecording();
//       setState(() => _isRecording = false);
//       final route = MaterialPageRoute(
//         fullscreenDialog: true,
//         builder: (_){
//             print("fooooooool${file.length()}");
//           return VideoItems(file: file.path);
//         },
//       );
//       Navigator.push(context, route);
//     } else {
//       await _cameraController.prepareForVideoRecording();
//       await _cameraController.startVideoRecording();
//       setState(() => _isRecording = true);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return Container(
//         color: Colors.white,
//         child: const Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     } else {
//       return Center(
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             CameraPreview(_cameraController),
//             Padding(
//               padding: const EdgeInsets.all(25),
//               child: FloatingActionButton(
//                 backgroundColor: Colors.red,
//                 child: Icon(_isRecording ? Icons.stop : Icons.circle),
//                 onPressed: () => _recordVideo(),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }