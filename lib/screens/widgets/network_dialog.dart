// ignore_for_file: unnecessary_const

import 'package:flutter/cupertino.dart';

void showNetworkErrorDialog(BuildContext? context, dynamic onTap) {
  showCupertinoDialog(
    context: context!,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: const Text(
//          translator.currentLanguage == "en"
//              ? "please check your internet connection"
//              :
          "تأكد من الاتصال بالانترنت",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            // color: AppTheme.primaryColor,
            // fontFamily: AppTheme.fontName
          ),
        ),
        actions: <Widget>[
          CupertinoButton(
            onPressed: onTap,
            child: const Text(
//              translator.currentLanguage == "en"
//                  ? "Try again"
//                  :
              "حاول مرة أخرى",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                // color: AppTheme.secondaryColor,
                // fontFamily: AppTheme.boldFont
              ),
            ),
          ),
        ],
      );
    },
  );
}
