// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class SmallButtonSizer extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  final String? image;
  // ignore: prefer_typing_uninitialized_variables
  final isLoading;
  // ignore: prefer_typing_uninitialized_variables
  final loadingColor;
  // ignore: use_key_in_widget_constructors
  const SmallButtonSizer({
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
        //margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color!, width: 1.5),
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
                            fontFamily: 'DinBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
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
