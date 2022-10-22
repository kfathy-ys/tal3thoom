import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/keys.dart';
import '../../../../widgets/constants.dart';

enum TypeSessionName {
  EX_TRE_S1,
  EX_TRE_S2,
  EX_TRE_S3,
  EX_TRE_S4,
  EX_TRE_S5,
  EX_TRE_S6,
  EX_TRE_S7,
  EX_TRE_S8,
  EX_TRE_S9,
  EX_TRE_S10,
  EX_TRE_S11,
  EX_TRE_S12,
  EX_TRE_S13,
  EX_TRE_S14,
  EX_TRE_S15,
  EX_TRE_S16,
  EX_TRE_S17,
  EX_TRE_S18,
  EX_TRE_S19,
  EX_TRE_S20,
  EX_TRE_S21,
  EX_TRE_S22,
  EX_TRE_S23,
  EX_TRE_S24,
  EX_TRE_S25,
  EX_TRE_S26,
  EX_TRE_S27,
  EX_TRE_S28,
  EX_TRE_S29,
  EX_TRE_S30
}

class DropDownListResultSessions extends StatefulWidget {
  final String? initial;
  final ValueChanged<String> onChanged;

  const DropDownListResultSessions(
      {Key? key, required this.onChanged, this.initial})
      : super(key: key);

  @override
  State<DropDownListResultSessions> createState() =>
      _DropDownListResultSessionsState();
}

class _DropDownListResultSessionsState
    extends State<DropDownListResultSessions> {
  TypeSessionName? selected;
  String? valueSelected;

  @override
  void initState() {
    if (widget.initial != null) {
      if (widget.initial == "EX_TRE_S1") {
        selected = TypeSessionName.EX_TRE_S1;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S2") {
        selected = TypeSessionName.EX_TRE_S2;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S3") {
        selected = TypeSessionName.EX_TRE_S3;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S4") {
        selected = TypeSessionName.EX_TRE_S4;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S5") {
        selected = TypeSessionName.EX_TRE_S5;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S6") {
        selected = TypeSessionName.EX_TRE_S6;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S7") {
        selected = TypeSessionName.EX_TRE_S7;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S8") {
        selected = TypeSessionName.EX_TRE_S8;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S9") {
        selected = TypeSessionName.EX_TRE_S9;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S10") {
        selected = TypeSessionName.EX_TRE_S10;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S11") {
        selected = TypeSessionName.EX_TRE_S11;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S12") {
        selected = TypeSessionName.EX_TRE_S12;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S13") {
        selected = TypeSessionName.EX_TRE_S13;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S14") {
        selected = TypeSessionName.EX_TRE_S14;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S15") {
        selected = TypeSessionName.EX_TRE_S15;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S16") {
        selected = TypeSessionName.EX_TRE_S16;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S17") {
        selected = TypeSessionName.EX_TRE_S17;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S18") {
        selected = TypeSessionName.EX_TRE_S18;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S19") {
        selected = TypeSessionName.EX_TRE_S19;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S20") {
        selected = TypeSessionName.EX_TRE_S20;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S21") {
        selected = TypeSessionName.EX_TRE_S21;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S22") {
        selected = TypeSessionName.EX_TRE_S22;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S23") {
        selected = TypeSessionName.EX_TRE_S23;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S24") {
        selected = TypeSessionName.EX_TRE_S24;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S25") {
        selected = TypeSessionName.EX_TRE_S25;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S26") {
        selected = TypeSessionName.EX_TRE_S26;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S27") {
        selected = TypeSessionName.EX_TRE_S27;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S28") {
        selected = TypeSessionName.EX_TRE_S28;
        valueSelected = widget.initial;
      } else if (widget.initial == "EX_TRE_S29") {
        selected = TypeSessionName.EX_TRE_S29;
        valueSelected = widget.initial;
      } else {
        selected = TypeSessionName.EX_TRE_S30;
        valueSelected = widget.initial;
      }
    }
    super.initState();
  }

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
        child: DropdownButtonFormField<TypeSessionName>(
          isExpanded: true,
          value: selected,
          validator: (value) {
            if (value == null) {
              return KeysConfig.thisFieldRequired;
            }
            return null;
          },

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
          onChanged: (TypeSessionName? newValue) {
            if (newValue == null) return;

            setState(() {
              selected = newValue;
              if (selected == TypeSessionName.EX_TRE_S1) {
                valueSelected = "EX_TRE_S1";
              } else if (selected == TypeSessionName.EX_TRE_S2) {
                valueSelected = "EX_TRE_S2";
              } else if (selected == TypeSessionName.EX_TRE_S3) {
                valueSelected = "EX_TRE_S3";
              } else if (selected == TypeSessionName.EX_TRE_S4) {
                valueSelected = "EX_TRE_S4";
              } else if (selected == TypeSessionName.EX_TRE_S5) {
                valueSelected = "EX_TRE_S5";
              } else if (selected == TypeSessionName.EX_TRE_S6) {
                valueSelected = "EX_TRE_S6";
              } else if (selected == TypeSessionName.EX_TRE_S7) {
                valueSelected = "EX_TRE_S7";
              } else if (selected == TypeSessionName.EX_TRE_S8) {
                valueSelected = "EX_TRE_S8";
              } else if (selected == TypeSessionName.EX_TRE_S9) {
                valueSelected = "EX_TRE_S9";
              } else if (selected == TypeSessionName.EX_TRE_S10) {
                valueSelected = "EX_TRE_S10";
              } else if (selected == TypeSessionName.EX_TRE_S11) {
                valueSelected = "EX_TRE_S11";
              } else if (selected == TypeSessionName.EX_TRE_S12) {
                valueSelected = "EX_TRE_S12";
              } else if (selected == TypeSessionName.EX_TRE_S13) {
                valueSelected = "EX_TRE_S13";
              } else if (selected == TypeSessionName.EX_TRE_S14) {
                valueSelected = "EX_TRE_S14";
              } else if (selected == TypeSessionName.EX_TRE_S15) {
                valueSelected = "EX_TRE_S15";
              } else if (selected == TypeSessionName.EX_TRE_S16) {
                valueSelected = "EX_TRE_S16";
              } else if (selected == TypeSessionName.EX_TRE_S17) {
                valueSelected = "EX_TRE_S17";
              } else if (selected == TypeSessionName.EX_TRE_S18) {
                valueSelected = "EX_TRE_S18";
              } else if (selected == TypeSessionName.EX_TRE_S19) {
                valueSelected = "EX_TRE_S19";
              } else if (selected == TypeSessionName.EX_TRE_S20) {
                valueSelected = "EX_TRE_S20";
              } else if (selected == TypeSessionName.EX_TRE_S21) {
                valueSelected = "EX_TRE_S21";
              } else if (selected == TypeSessionName.EX_TRE_S22) {
                valueSelected = "EX_TRE_S22";
              } else if (selected == TypeSessionName.EX_TRE_S23) {
                valueSelected = "EX_TRE_S23";
              } else if (selected == TypeSessionName.EX_TRE_S24) {
                valueSelected = "EX_TRE_S24";
              } else if (selected == TypeSessionName.EX_TRE_S25) {
                valueSelected = "EX_TRE_S25";
              } else if (selected == TypeSessionName.EX_TRE_S26) {
                valueSelected = "EX_TRE_S26";
              } else if (selected == TypeSessionName.EX_TRE_S27) {
                valueSelected = "EX_TRE_S27";
              } else if (selected == TypeSessionName.EX_TRE_S28) {
                valueSelected = "EX_TRE_S28";
              } else if (selected == TypeSessionName.EX_TRE_S29) {
                valueSelected = "EX_TRE_S29";
              } else {
                valueSelected = "EX_TRE_S30";
              }
              widget.onChanged(valueSelected!);
            });
          },
          items: TypeSessionName.values
              .map<DropdownMenuItem<TypeSessionName>>((TypeSessionName value) {
            return DropdownMenuItem<TypeSessionName>(
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
