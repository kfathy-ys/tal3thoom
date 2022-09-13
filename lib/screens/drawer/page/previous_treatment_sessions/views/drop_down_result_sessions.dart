import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/constants.dart';

class DropDownListResultSessions extends StatefulWidget {
  const DropDownListResultSessions({Key? key}) : super(key: key);

  @override
  State<DropDownListResultSessions> createState() =>
      _DropDownListResultSessionsState();
}

class _DropDownListResultSessionsState
    extends State<DropDownListResultSessions> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    //  // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: context.width * 0.8,
      // height: height*0.09,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: kPrimaryColor)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          // autofocus: true,
          // isDense: true,
          //isExpanded: true,
          hint: const Text(
            "الجلسة العلاجية" ' :',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontFamily: "DinReguler",
            ),
          ),
          borderRadius: BorderRadius.circular(10),
          icon: Image.asset("assets/images/down arrow.png"),
          //  elevation: 16,
          style: const TextStyle(
            color: kTextColor,
            fontSize: 16,
            fontFamily: "DinReguler",
          ),
          underline: null,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            "الجلسه الأولي",
            "الجلسه الثانية",
            "الجلسه الثالثة",
            "الجلسه الرابعة",
            "الجلسه الخامسة",
            "الجلسه السادسة",
            "الجلسه السابعة",
            "الجلسه الثامنة",
            "الجلسه التاسعة",
            "الجلسه العاشرة",
            "الجلسه الحادي عشر ",
            "الجلسه الثالث عشر",
            "الجلسه الرابع عشر",
            "الجلسه الخامس عشر",
            "الجلسه السادس عشر",
            "الجلسه السابع عشر",
            "الجلسه الثامن عشر",
            "الجلسه التاسع عشر",
            "الجلسه العشرون",
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: kBlackText,
                  fontSize: 16,
                  fontFamily: "DinReguler",
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
