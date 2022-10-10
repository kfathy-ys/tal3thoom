// // ignore_for_file: file_names
//
// import 'package:flutter/material.dart';
//
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
//
// import 'constants.dart';
//
// class SmallestButton extends StatelessWidget {
//   final VoidCallback? onPressed;
//   final String? title;
//   final Color? color;
//   final String? image;
//   // ignore: prefer_typing_uninitialized_variables
//   final isLoading;
//   // ignore: prefer_typing_uninitialized_variables
//   final loadingColor;
//   // ignore: use_key_in_widget_constructors
//   const SmallestButton({
//     required this.onPressed,
//     required this.title,
//     this.color,
//     this.isLoading = false,
//     this.loadingColor = false,
//     this.image,
//   });
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         height: MediaQuery.of(context).size.height / 15,
//         width: context.width * 0.3,
//         decoration: BoxDecoration(
//             color: color == null ? Colors.white : kSafeAreasColor,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: kPrimaryColor, width: 1.5)),
//         child: Center(
//           child: isLoading != true
//               ? Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Get.locale == const Locale('ar', 'EG')
//                         ? Align(
//                             alignment: Alignment.centerLeft,
//                             child: Image.asset(image!))
//                         : Align(
//                             alignment: Alignment.centerRight,
//                             child: Image.asset(image!)),
//                     Get.locale == const Locale('ar', 'EG')
//                         ? Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(title!,
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'DinBold',
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16)),
//                           )
//                         : Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(title!,
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'DinBold',
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16)),
//                           ),
//                   ],
//                 )
//               : SpinKitChasingDots(
//                   size: 20,
//                   color: loadingColor ?? Colors.white,
//                 ),
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

class SmallButtonOases extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;


  final bool isLoading;
   final Color? loadingColor;
  // ignore: use_key_in_widget_constructors
  const SmallButtonOases(
      {required this.onPressed,
      required this.title,
      this.color,
      this.isLoading = false,
      this.loadingColor });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: color,
          //== null ? kButtonGreenDark : kPrimaryColor
          borderRadius: BorderRadius.circular(8),
          //  border: Border.all(color: kPrimaryColor, width: 1.5),
        ),
        child: Center(
          child: isLoading != true
              ? Text(title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: kHomeColor,
                      fontFamily: 'DinBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 20))
              : SpinKitChasingDots(
                  size: 20,
                  color: loadingColor ?? Colors.white,
                ),
        ),
      ),
    );
  }
}
