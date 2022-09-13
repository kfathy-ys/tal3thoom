import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';

class DropDownDurations extends StatefulWidget {
  const DropDownDurations({Key? key}) : super(key: key);

  @override
  State<DropDownDurations> createState() => _DropDownDurationsState();
}

class _DropDownDurationsState extends State<DropDownDurations> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      width: MediaQuery.of(context).size.width / 1.2,
      height: context.height * 0.069,
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
            "مدة الجلسة" ' :',
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
            color: kPrimaryColor,
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
            "15 دقيقة",
            "30 دقيقة",
            "45 دقيقة",
            "60 دقيقة",
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: kPrimaryColor,
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
