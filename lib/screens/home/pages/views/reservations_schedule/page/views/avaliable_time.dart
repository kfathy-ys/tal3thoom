import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/constants.dart';


class AvailableTime extends StatefulWidget {
  const AvailableTime({Key? key}) : super(key: key);

  // final List<AvailablePeriods> periods;
  //
  // const AvailableTime({
  //   Key? key,
  //   required this.periods,
  // }) : super(key: key);

  @override
  State<AvailableTime> createState() => _AvailableTimeState();
}

class _AvailableTimeState extends State<AvailableTime> {
  // bool isPressed = false;
  final int _selectedTimeId = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
      height: context.height * 0.069,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount:5,
        //widget.periods.length,
        itemBuilder: (context, int index) {
          return InkWell(
            onTap: () {
              // setState(() {
              //   _selectedTimeId = widget.periods[index].id!;
              //   Prefs.setBool("isClicked", true);
              // });
            },
            child: Container(
              height: context.height * 0.069,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  // border: _selectedTimeId == widget.periods[index].id
                  //     ? Border.all(color: kHomeColor)
                  //     : Border.all(color: kButtonGreenDark),
                  color: _selectedTimeId == 0
                      ? kButtonGreenDark
                      : kHomeColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                     "12:30 PM\t\t",
                   // widget.periods[index].periodFrom ?? '',
                    style: TextStyle(
                      color: _selectedTimeId == 0
                          ? kHomeColor
                          : kButtonGreenDark,
                      fontSize: 16,
                      fontFamily: "DinReguler",
                    ),
                  ),

                  const Text(
                    ' : ',
                    style: TextStyle(
                      color: kBlackText,
                      fontSize: 16,
                      fontFamily: "DinBold",
                    ),
                  ),
                  Text(
                    "12:45 PM",
                  //  widget.periods[index].periodTo ?? '',
                    style: TextStyle(
                      color: _selectedTimeId == 0
                          ? kHomeColor
                          : kButtonGreenDark,
                      fontSize: 16,
                      fontFamily: "DinReguler",
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
