// /*
// import 'dart:developer' as developer;
//
// import 'package:palestine_connection/palestine_connection.dart';
//
// void main() {
//   final PalestineConnection connection = PalestineConnection();
//   connection.initialize(
//     domain: PalestineConnectionDomain.google, // Domain To Test On (optional)
//     periodicInSeconds: 3, // 3 seconds
//     onConnectionLost: () {
//       developer.log('No Internet');
//     },
//     onConnectionRestored: () {
//       developer.log('Connection Restored');
//     },
//   );
// }*/
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';
//
// Widget isOffline({required Widget child}){
//   return OfflineBuilder(
//     connectivityBuilder: (
//         BuildContext context,
//         ConnectivityResult connectivity,
//         Widget child,
//         ) {
//       final bool connected = connectivity != ConnectivityResult.none;
//       return Stack(
//         fit: StackFit.expand,
//         children: [
//           Positioned(
//             height: 24.0,
//             left: 0.0,
//             right: 0.0,
//             child: Container(
//               color: connected ? const Color(0xFF00EE44) : const Color(0xFFEE4400),
//               child: Center(
//                 child: Text(connected ? 'تم الإتصال بنجاح' : 'غير متصل بالانترنت'),
//               ),
//             ),
//           ),
//           const Center(
//             child: Text(
//               'Yay!',
//             ),
//           ),
//         ],
//       );
//     },
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: const <Widget>[
//         Text(
//           'There are no bottons to push :)',
//         ),
//         Text(
//           'Just turn off your internet.',
//         ),
//       ],
//     ),
//   );
// }
