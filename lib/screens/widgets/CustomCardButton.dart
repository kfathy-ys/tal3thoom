// ignore_for_file: file_names, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legacy_buttons/LegacyRaisedButton.dart';

import 'constants.dart';

class CustomCardButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  // final IconData? icon;
  final String? image;
  final bool isLoading;
  const CustomCardButton(
      {this.onPressed,
      this.title,
      this.color,
      this.isLoading = false,
      this.image});
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 1.2,
      child: LegacyRaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading != true
                ? Row(
                    children: [
                      Image.asset(image!),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        title!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'DinMedium',
                            fontSize: 16),
                      ),
                    ],
                  )
                : const SpinKitChasingDots(
                    size: 20,
                    color: Colors.white,
                  ),
          ],
        ),
        color: color ?? kPrimaryColor,
        onPressed: onPressed,
        elevation: 0,
      ),
    );
  }
}
