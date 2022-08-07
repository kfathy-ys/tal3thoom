// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'constants.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  CustomScaffold({this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(180),
                bottomLeft: Radius.circular(180),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
