import 'package:flutter/material.dart';
import 'package:queen/core.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../drawer/page/diagnostic_service/page/views/resevation_diagnostic/models/avalible_periods_model.dart';
import '../../../../../../widgets/constants.dart';

class AvailableTime extends StatefulWidget {
  final List<AvailablePeriods> periods;
  final Function(String) onSelect;
  const AvailableTime({
    Key? key,
    required this.periods,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<AvailableTime> createState() => _AvailableTimeState();
}

class _AvailableTimeState extends State<AvailableTime> {
  // bool isPressed = false;
  dynamic _selectedTimeId = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
      height: height * 0.089,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.periods.length,
        itemBuilder: (context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedTimeId = widget.periods[index].startTime;
                widget.onSelect(_selectedTimeId.toString());

                Prefs.setBool("isClicked", true);
              });
            },
            child: Container(
              height: height * 0.079,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  border: _selectedTimeId == widget.periods[index].startTime
                      ? Border.all(color: kButtonGreenDark)
                      : Border.all(color: kButtonGreenDark),
                  color: _selectedTimeId == widget.periods[index].startTime
                      ? kButtonGreenDark
                      : kHomeColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  // "6:35 PM\t\t".tr
                  widget.periods[index].startTime,
                  style: TextStyle(
                    color: _selectedTimeId == widget.periods[index].startTime
                        ? kHomeColor
                        : kBlackText,
                    fontSize: 16,
                    fontFamily: "DinReguler",
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
