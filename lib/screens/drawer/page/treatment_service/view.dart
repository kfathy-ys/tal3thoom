// import 'package:flutter/material.dart';
//
// import '../../../widgets/constants.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:tal3thoom/generated/locale_keys.g.dart';
//
// // ignore: must_be_immutable
// class TreatmentService extends StatelessWidget {
//   final VoidCallback onTapInductions;
//   final VoidCallback onTapPayment;
//   final VoidCallback onTapHistory;
//
//   final VoidCallback onTaptherapeuticSessions;
//   final VoidCallback onTapOases;
//   final VoidCallback onTapSSRS;
//   final VoidCallback onTapSSI4;
//   final VoidCallback onTapBookSpecialist;
//   final VoidCallback onTaptherapeuticSessions2;
//   final VoidCallback onTapOases2;
//   final VoidCallback onTapSSRS2;
//   final VoidCallback onTapSSI42;
//   final VoidCallback onTapBookSpecialist2;
//
//   TreatmentService({
//     required this.onTapInductions,
//     required this.onTapPayment,
//     required this.onTapHistory,
//     required this.onTapSSRS,
//     required this.onTaptherapeuticSessions,
//     required this.onTapOases,
//     required this.onTapSSI4,
//     required this.onTapBookSpecialist,
//     required this.onTaptherapeuticSessions2,
//     required this.onTapOases2,
//     required this.onTapSSRS2,
//     required this.onTapSSI42,
//     required this.onTapBookSpecialist2,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     // double width = MediaQuery.of(context).size.width;
//     return ExpansionTile(
//         backgroundColor: kPrimaryColor,
//         leading: Image.asset("assets/images/treatment.png"),
//         trailing: Image.asset(
//           "assets/images/yellow right arrow.png",
//         ),
//         title: customText2(
//             title: KeysConfig.treatmentService , color: kHomeColor),
//         children: [
//           Container(
//             height: height * 0.08,
//             color: kRoundBorderColor,
//             child: ListTile(
//               onTap: onTapInductions,
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/book.png"),
//                   buildSizedBox(),
//                   customText4(
//                       title: KeysConfig.IntroductionService ,
//                       color: kBlackText),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             height: height * 0.08,
//             color: kRoundBorderColor,
//             child: ListTile(
//               onTap: onTapPayment,
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/wallet.png"),
//                   buildSizedBox(),
//                   customText4(
//                       title: KeysConfig.payment , color: kBlackText),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             height: height * 0.08,
//             color: kRoundBorderColor,
//             child: ListTile(
//               onTap: onTapHistory,
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/paper.png"),
//                   buildSizedBox(),
//                   customText4(
//                       title: KeysConfig.medicalHistory , color: kBlackText),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             color: kRoundBorderColor,
//             child: ExpansionTile(
//               trailing: Image.asset(
//                 "assets/images/yellow right arrow.png",
//               ),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/1 . treatment.png"),
//                   buildSizedBox(),
//                   customText4(title: KeysConfig.first , color: kBlackText),
//                 ],
//               ),
//               children: [
//                 Container(
//                   height: height * 0.08,
//                   color: kSkyLightsColor.withOpacity(0.2),
//                   child: ListTile(
//                     onTap: onTaptherapeuticSessions,
//                     title: Row(
//                       children: [
//                         Image.asset("assets/images/Documents.png"),
//                         buildSizedBox(),
//                         customText4(
//                             title: KeysConfig.therapeuticSessions ,
//                             color: kBlackText),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: height * 0.08,
//                   color: kSkyLightsColor.withOpacity(0.2),
//                   child: ListTile(
//                     onTap: onTapOases,
//                     title: Row(
//                       children: [
//                         Image.asset("assets/images/square question.png"),
//                         buildSizedBox(),
//                         customText4(
//                             title: KeysConfig.testOases ,
//                             color: kBlackText),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: kSkyLightsColor.withOpacity(0.2),
//                   height: height * 0.08,
//                   child: ListTile(
//                     onTap: onTapSSRS,
//                     title: Row(
//                       children: [
//                         Image.asset("assets/images/circular question.png"),
//                         buildSizedBox(),
//                         customText4(
//                             title: KeysConfig.testSSRS , color: kBlackText),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: kSkyLightsColor.withOpacity(0.2),
//                   height: height * 0.08,
//                   child: ListTile(
//                     onTap: onTapSSI4,
//                     title: Row(
//                       children: [
//                         Image.asset("assets/images/paper.png"),
//                         buildSizedBox(),
//                         customText4(
//                             title: KeysConfig.test4 , color: kBlackText),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: height * 0.08,
//                   color: kSkyLightsColor.withOpacity(0.2),
//                   child: ListTile(
//                     onTap: onTapBookSpecialist,
//                     title: Row(
//                       children: [
//                         Image.asset("assets/images/addition.png"),
//                         buildSizedBox(),
//                         customText4(
//                             title: KeysConfig.BookSpecialist ,
//                             color: kBlackText),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             color: kRoundBorderColor,
//             child: ExpansionTile(
//               trailing: Image.asset(
//                 "assets/images/yellow right arrow.png",
//               ),
//               title: Row(
//                 children: [
//                   Image.asset("assets/images/2 . treatment.png"),
//                   buildSizedBox(),
//                   customText4(title: KeysConfig.second , color: kBlackText),
//                 ],
//               ),
//               children: [
//                 Container(
//                   height: height * 0.08,
//                   color: kSkyLightsColor.withOpacity(0.2),
//                   child: ListTile(
//                     onTap: onTaptherapeuticSessions2,
//                     title: Row(
//                       children: [
//                         Image.asset("assets/images/Documents.png"),
//                         buildSizedBox(),
//                         customText4(
//                             title: KeysConfig.therapeuticSessions ,
//                             color: kBlackText),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: height * 0.08,
//                   color: kSkyLightsColor.withOpacity(0.2),
//                   child: ListTile(
//                     onTap: onTapOases2,
//                     title: Row(
//                       children: [
//                         Image.asset("assets/images/square question.png"),
//                         buildSizedBox(),
//                         customText4(
//                             title: KeysConfig.testOases ,
//                             color: kBlackText),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: kSkyLightsColor.withOpacity(0.2),
//                   height: height * 0.08,
//                   child: ListTile(
//                     onTap: onTapSSRS2,
//                     title: Row(
//                       children: [
//                         Image.asset("assets/images/circular question.png"),
//                         buildSizedBox(),
//                         customText4(
//                             title: KeysConfig.testSSRS , color: kBlackText),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: kSkyLightsColor.withOpacity(0.2),
//                   height: height * 0.08,
//                   child: ListTile(
//                     onTap: onTapSSI42,
//                     title: Row(
//                       children: [
//                         Image.asset("assets/images/paper.png"),
//                         buildSizedBox(),
//                         customText4(
//                             title: KeysConfig.test4 , color: kBlackText),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: height * 0.08,
//                   color: kSkyLightsColor.withOpacity(0.2),
//                   child: ListTile(
//                     onTap: onTapBookSpecialist2,
//                     title: Row(
//                       children: [
//                         Image.asset("assets/images/addition.png"),
//                         buildSizedBox(),
//                         customText4(
//                             title: KeysConfig.BookSpecialist ,
//                             color: kBlackText),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ]);
//   }
//
//   SizedBox buildSizedBox() => SizedBox(
//         width: 10,
//       );
// }


import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../config/keys.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/video_items.dart';
import '../../view.dart';
import 'page/views/payment_treatment_service.dart';


// ignore: must_be_immutable
class TreatmentServiceInduction extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kHomeColor,
      drawer: MenueItems(),
      appBar: DynamicAppbar(
          context: context,
          press: () => scaffoldKey.currentState!.openDrawer()),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width ,

          child: SingleChildScrollView(
            child:


            Column(
              children: [
                CustomTileContainer(
                    widthh: width * 0.5,
                    title: "رحلة العلاج",
                    context: context),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset("assets/images/treatmentDis.png"),
                ),

                SizedBox(
                  width: width*0.8,
                  height: height*0.25,
                  child: VideoItems(
                    videoPlayerController: VideoPlayerController.network(
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    ),
                  ),
                ),
                MediaButton(
                  onPressed: () {
                    navigateTo(context, PaymentTreatment());
                  },
                  title: KeysConfig.next ,
                ),
                SizedBox(height: height*0.15,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(
    height: height * 0.2,
  );
}
