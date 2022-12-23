import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../widgets/constants.dart';
import '../../../models/advisor_model.dart';

class DropDownSpecialist extends StatefulWidget {
  final ValueChanged<AllAdvisors> onChanged;
  final AllAdvisors? initial;
  const DropDownSpecialist({Key? key, required this.onChanged, this.initial})
      : super(key: key);

  @override
  State<DropDownSpecialist> createState() => _DropDownSpecialistState();
}

class _DropDownSpecialistState extends State<DropDownSpecialist> {
  AllAdvisors? selected;
  final libs = <AllAdvisors>[];
  @override
  void initState() {
    if (widget.initial != null) {
      selected = widget.initial;
    }
    getAllAdvisors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      width: MediaQuery.of(context).size.width / 1.9,
      height: context.height * 0.069,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: kPrimaryColor)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<AllAdvisors>(
          value: selected,

          hint: const Text(
            "الأخصائي" ' :',
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
          onChanged: (AllAdvisors? newValue) {
            if (newValue == null) return;
            selected = newValue;

            widget.onChanged(selected!);

            setState(() {});
          },
          items: libs.map<DropdownMenuItem<AllAdvisors>>((AllAdvisors value) {
            return DropdownMenuItem<AllAdvisors>(
              value: value,
              child: Text(
                value.fullName!,
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

  Future<void> getAllAdvisors() async {
    libs.clear();
    final res =
        await NetWork.get('Specialist/GetSpecialistsThatHaveConsultationDates');
    (res.data['data'] as List)
        .map((e) => libs.add(AllAdvisors.fromJson(e)))
        .toList();

    setState(() {});

    // AllAdvisors allAdvisors = AllAdvisors.fromJson((res.data['data']));
    //
    //
    // Prefs.setString("userId", allAdvisors.userId!);
    // log("${res.data["data"]["userId"]}");
  }
}
