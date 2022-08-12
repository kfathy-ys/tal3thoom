// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

class SmallButtonSizerUploadFile extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  final String? image;
  // ignore: prefer_typing_uninitialized_variables
  final isLoading;
  // ignore: prefer_typing_uninitialized_variables
  final loadingColor;
  // ignore: use_key_in_widget_constructors
  const SmallButtonSizerUploadFile({
    required this.onPressed,
    required this.title,
    this.color,
    this.isLoading = false,
    this.loadingColor = false,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: MediaQuery.of(context).size.height / 18,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: color == kSmallIconColor ? kSmallIconColor : kTextFieldColor,
          borderRadius: BorderRadius.circular(8),
          //border: Border.all(color: kPrimaryColor, width: 1.5)
        ),
        child: Center(
          child: isLoading != true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(image!),
                    // SizedBox(width: width*0.02,),
                    Text(title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'DinReguler',
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
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
