import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget main_text(String txt, double sz, var cr, TextAlign textAlign) {
  return Text(txt,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: "Contrail-Bold",
        fontSize: sz,
        color: cr,
      ));
}
