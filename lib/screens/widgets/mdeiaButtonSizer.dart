// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

class MediaButtonSizer extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  final String? image;
  // ignore: prefer_typing_uninitialized_variables
  final isLoading;
  // ignore: prefer_typing_uninitialized_variables
  final loadingColor;
  // ignore: use_key_in_widget_constructors
  final double? width;
  const MediaButtonSizer({
    required this.onPressed,
    required this.title,
    this.color,
    this.isLoading = false,
    this.loadingColor = false,
    this.image,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: MediaQuery.of(context).size.height / 15,
        width: width ?? MediaQuery.of(context).size.width / 2.72,
        decoration: BoxDecoration(
            color: color == null ? Colors.white : kSafeAreasColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kPrimaryColor, width: 1.5)),
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
                            fontFamily: 'DinBold',
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
