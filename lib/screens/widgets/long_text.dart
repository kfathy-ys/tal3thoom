import 'package:flutter/material.dart';

import 'constants.dart';

class LongText extends StatelessWidget {
  final String? text;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  LongText({this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        text!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: "Contrail",
          color: kTextColor,
        ),
      ),
    );
  }
}
