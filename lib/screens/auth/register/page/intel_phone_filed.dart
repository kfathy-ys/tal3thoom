// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:maktabat_alharam/screens/widgets/constants.dart';
// class IntelPhoneField extends StatelessWidget {
//
//   final Function onChanged;
//   final Function onCountryChanged;
//
//   const IntelPhoneField({Key? key, required this.onChanged,required this.onCountryChanged}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return                 Container(
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//
//       child: IntlPhoneField(
//
//
//         decoration:  InputDecoration(
//           labelStyle:  const TextStyle(
//             fontSize: 16,
//             color: kPrimaryColor,
//             fontFamily: "DinReguler",
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: kPrimaryColor, width: 1),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: kPrimaryColor, width: 2),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           border: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red),
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         initialCountryCode: 'SA',
//         onChanged: onChanged(),
//
//         onCountryChanged: onCountryChanged()
//       ),
//     );
//   }
// }
