import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget MainTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    child: Text(
      title,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontFamily: "Contrail",
        color: Colors.black,
        fontSize: 38,
      ),
    ),
  );
}
