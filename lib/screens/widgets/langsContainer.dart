// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'constants.dart';

class LangContainer extends StatelessWidget {
  final String? title;
  final String? lang;
  final VoidCallback? onTap;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  LangContainer({this.title, this.lang, this.onTap});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * .18,
        width: height * .18,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title!,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            Text(
              lang!,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
