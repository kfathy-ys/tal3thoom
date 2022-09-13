import 'package:flutter/material.dart';

enum AppTheme {
  lightAppTheme,
  darkAppTheme,
}

final appThemeData = {
  AppTheme.darkAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.brown,
    textTheme: TextTheme(
      bodyText2: const TextStyle().copyWith(color: Colors.white),
      bodyText1: const TextStyle().copyWith(color: Colors.yellowAccent),
    ),
  ),
  AppTheme.lightAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.amber,
    textTheme: TextTheme(
      bodyText2: const TextStyle().copyWith(color: Colors.white),
      bodyText1: const TextStyle().copyWith(color: Colors.black),
    ),
  ),
};
