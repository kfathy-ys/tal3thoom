import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/date_convertors.dart';

class DropDownAvailableDates extends StatefulWidget {
  final dynamic userProfileId;
  final dynamic time;
  final ValueChanged<dynamic> onChanged;
  final dynamic initial;
  const DropDownAvailableDates(
      {Key? key,
      required this.onChanged,
      this.initial,
      required this.userProfileId,
      this.time})
      : super(key: key);

  @override
  State<DropDownAvailableDates> createState() => _DropDownAvailableDatesState();
}

class _DropDownAvailableDatesState extends State<DropDownAvailableDates> {
  dynamic selected;
  final List<dynamic> libs = [];
  @override
  void initState() {
    if (widget.initial != null) {
      selected = widget.initial;
    }
    getAllDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        child: DropdownButton<dynamic>(
          value: selected,
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
          onChanged: (dynamic? newValue) {
            if (newValue == null) return;
            selected = newValue;

            widget.onChanged(selected!);

            setState(() {});
          },
          items: libs.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text(
                DateConverter.dateConverterOnlys(value),
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

  Future<void> getAllDates() async {
    libs.clear();
    final res = await NetWork.get(
        'Schedule/GetSpecialistAvailableSessionDurationDates/${widget.userProfileId}/${widget.time}/Consult');

    print("Timmmmmmmmmmmme" + res.data["data"].runtimeType.toString());

    libs.addAll(res.data['data']);

    print("Timmmmmmmmmmmme" + res.data["data"].toString());
    setState(() {});
  }
}
