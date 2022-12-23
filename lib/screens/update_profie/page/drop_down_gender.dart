import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/config/keys.dart';

import '../../widgets/constants.dart';

enum TypeSex { Male, Female }

class DropDownGender extends StatefulWidget {
  final String? initial;
  final ValueChanged<String> onChanged;
  const DropDownGender({Key? key, required this.onChanged, this.initial})
      : super(key: key);

  @override
  State<DropDownGender> createState() => _DropDownGenderState();
}

class _DropDownGenderState extends State<DropDownGender> {
  TypeSex? selected;
  String? valueSelected;

  @override
  void initState() {
    if (widget.initial != null) {
      if (widget.initial == "Male") {
        selected = TypeSex.Male;
        valueSelected = widget.initial;
      } else {
        selected = TypeSex.Female;
        valueSelected = widget.initial;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return DropdownButtonHideUnderline(
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
        width: MediaQuery.of(context).size.width / 1.2,
        //  height: height*0.15,
        //  decoration: BoxDecoration(
        //      borderRadius: BorderRadius.circular(8),
        //      color: Colors.white,
        //      border: Border.all(color: kPrimaryColor),
        //
        //  ),
        child: DropdownButtonFormField<TypeSex>(
          isExpanded: true,
          value: selected,
          // autofocus: true,
          // isDense: true,
          // isExpanded: true,
          validator: (value) {
            if (value == null) {
              return KeysConfig.thisFieldRequired;
            }
            return null;
          },

          isDense: true,
          hint: const Text(
            "الجنس :",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontFamily: "DinReguler",
            ),
          ),

          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
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

          /// underline: null,
          onChanged: (TypeSex? newValue) {
            if (newValue == null) return;

            setState(() {
              selected = newValue;
              if (selected == TypeSex.Male) {
                valueSelected = "Male";
              } else {
                valueSelected = "Female";
              }
              widget.onChanged(valueSelected!);
            });
          },
          items: TypeSex.values.map<DropdownMenuItem<TypeSex>>((TypeSex value) {
            return DropdownMenuItem<TypeSex>(
              value: value,
              child: Text(
                describeEnum(value).tr,
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
