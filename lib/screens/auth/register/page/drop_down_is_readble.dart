import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/keys.dart';
import '../../../widgets/constants.dart';

enum TypeRead { Read, UnRead }

class DropDownRead extends StatefulWidget {
  final String? initial;
  final ValueChanged<String> onChanged;
  const DropDownRead({Key? key, required this.onChanged, this.initial})
      : super(key: key);

  @override
  State<DropDownRead> createState() => _DropDownReadState();
}

class _DropDownReadState extends State<DropDownRead> {
  TypeRead? selected;
  String? valueSelected;

  @override
  void initState() {
    if (widget.initial != null) {
      if (widget.initial == "Read") {
        selected = TypeRead.Read;
        valueSelected = widget.initial;
      } else {
        selected = TypeRead.UnRead;
        valueSelected = widget.initial;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
      width: MediaQuery.of(context).size.width / 1.2,
      // height: height*0.079,
      //  decoration: BoxDecoration(
      //      borderRadius: BorderRadius.circular(8),
      //      color: Colors.white,
      //      border: Border.all(color: kPrimaryColor)),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<TypeRead>(
          value: selected,
          // autofocus: true,
          // isDense: true,
          isExpanded: true,
          hint: const Text(
            "قارئ / غير قارئ" ' :'" *",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontFamily: "DinReguler",
            ),
          ),
          validator: (value) {
            if (value == null) {
              return KeysConfig.thisFieldRequired;
            }
            return null;
          },
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

          onChanged: (TypeRead? newValue) {
            if (newValue == null) return;

            setState(() {
              selected = newValue;
              if (selected == TypeRead.Read) {
                valueSelected = "R";
              } else {
                valueSelected = "N";
              }
              widget.onChanged(valueSelected!);
            });
          },
          items:
              TypeRead.values.map<DropdownMenuItem<TypeRead>>((TypeRead value) {
            return DropdownMenuItem<TypeRead>(
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
