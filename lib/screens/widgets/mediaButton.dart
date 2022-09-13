// ignore_for_file: deprecated_member_use, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legacy_buttons/LegacyRaisedButton.dart';

import 'constants.dart';

class MediaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  final bool isLoading;
  const MediaButton(
      {this.onPressed, this.title, this.color, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.7,
      child: LegacyRaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading != true
                ? Text(
                    title!,
                    style: const TextStyle(
                        color: kHomeColor,
                        fontFamily: 'DinBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                : const SpinKitChasingDots(
                    size: 20,
                    color: Colors.white,
                  ),
          ],
        ),
        color: color ?? kPrimaryColor,
        onPressed: onPressed,
        elevation: 3,
      ),
    );
  }
}
