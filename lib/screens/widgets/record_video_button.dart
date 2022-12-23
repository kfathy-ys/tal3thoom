// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

class SmallButtonSizerRecordVideo extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final Icon? icon;
  // ignore: prefer_typing_uninitialized_variables
  final isLoading;
  // ignore: prefer_typing_uninitialized_variables
  final loadingColor;
  // ignore: use_key_in_widget_constructors
  const SmallButtonSizerRecordVideo({
    required this.onPressed,
    this.color,
    this.isLoading = false,
    this.loadingColor = false,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: MediaQuery.of(context).size.height / 18,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          color: color == kSmallIconColor ? kSmallIconColor : kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
          //border: Border.all(color: kPrimaryColor, width: 1.5)
        ),
        child: Center(
          child: isLoading != true
              ? Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.camera_alt_outlined, color: kHomeColor),
                    // SizedBox(width: width*0.02,),
                    Text(
                      "هل ترغب في تسجيل فيديو جديد",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: kHomeColor,
                          fontFamily: "DinReguler"),
                    ),
                  ],
                )
              : SpinKitChasingDots(
                  size: 20,
                  color: loadingColor ?? Colors.white,
                ),
        ),
      ),
    );
  }
}
