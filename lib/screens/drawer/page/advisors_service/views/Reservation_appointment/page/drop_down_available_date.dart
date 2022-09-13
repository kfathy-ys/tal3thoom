import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';

class DropDownAvailableDates extends StatefulWidget {
  const DropDownAvailableDates({Key? key}) : super(key: key);

  @override
  State<DropDownAvailableDates> createState() => _DropDownAvailableDatesState();
}

class _DropDownAvailableDatesState extends State<DropDownAvailableDates> {
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
            "التواريخ المتاحة" ' :',
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
            "10-10-2022",
            "11-10-2022",
            "13-10-2022",
            "16-10-2022",
            "27-10-2022",
            "28-10-2022",
            "01-11-2022",
            "19-11-2022",
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
