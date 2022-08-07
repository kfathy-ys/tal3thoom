import 'package:flutter/cupertino.dart';

import 'data.dart';

class OurServicesModel {
  final Pages pages;
  final Widget icon;
  final String title;
  final String subTitle;
  final String routeName;

  OurServicesModel({
    required this.pages,
    required this.routeName,
    required this.title,
    required this.icon,
    required this.subTitle,
  });
}
