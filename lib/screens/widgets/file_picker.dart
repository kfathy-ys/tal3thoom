// import 'dart:developer';
// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
//
//
//
//
// class PickedFile extends StatefulWidget {
//   const PickedFile({Key? key}) : super(key: key);
//
//   @override
//   _PickedFileState createState() => _PickedFileState();
// }
//
// class _PickedFileState extends State<PickedFile> {
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center() ;
//
//   }
//   dynamic video;
//   File? _file;
//   void _uploadVideo() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: [
//         "MP4",
//         "MOV",
//         "WMV",
//         "AVI",
//         "AVCHD",
//         "FLV",
//         "F4V",
//         "SWF",
//         "MKV",
//         "WEBM",
//         "HTML5"
//       ],
//     );
//
//     if (result != null) {
//       File? file = File(result.files.single.path!);
//       log("-=-=-=-=- selected file is ${file.toString()}");
//       setState(() {
//         _file = file;
//        //video = file;
//       });
//     } else {
//       // User canceled the picker
//     }
//   }
//
//
//
// }
