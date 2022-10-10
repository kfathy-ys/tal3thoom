import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/resevation_diagnostic/page/all_specialists/view.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../home/pages/views/reservations_schedule/page/views/avaliable_time.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../view.dart';

// ignore: must_be_immutable
class FirstStageTreatmentReservation extends StatelessWidget {
  const FirstStageTreatmentReservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: context.height,
        width: context.width,
        color: kHomeColor,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTileContainer(
                    widthh: context.width / 2,
                    title: "حجز موعد مع المختص",
                    context: context),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                  child: Image.asset(
                    "assets/images/box.png",
                  ),
                ),
                customText8(
                    title:
                        "ملاحظة يرجي الرجوع لجدول الحجوزات لمعرفة حجوزاتك للمقابلات",
                    color: kButtonDashBoard),
                Container(
                  //color: kSafeAreaColor,

                  height: context.height * 0.42,
                  width: context.width * 0.8,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 14),

                  decoration: BoxDecoration(
                      border: Border.all(color: kSafeAreasColor),
                      color: kHomeColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8)),

                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2031),
                    onDateChanged: (value) {
                      // cubit.getAvailablePeriodsVisit(
                      //     selectedDate: value);
                      // cubit.visitDateId = cubit
                      //     .dates[cubit.availableDates.indexOf(value)]
                      //     .id;
                    },
                    //   selectableDayPredicate: (day) {
                    // if (cubit.dates.isNotEmpty) {
                    //   if (cubit.availableDates.contains(day)) {
                    //     return true;
                    //   } else {
                    //     return false;
                    //   }
                    // } else {
                    //   return true;
                    // }
                    //  },
                  ),
                ),
                customText8(
                    title: "تم إغلاق جميع الايام الغير متاح بيها مواعيد ",
                    color: kButtonDashBoard),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: context.height * 0.079,
                  width: context.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kBackGroundCard,
                  ),
                  child: Center(
                    child: customText7(
                        title: "الاوقات المتاحة", color: kPrimaryColor),
                  ),
                ),
                //const AvailableTime(),
                SmallButton(
                  title: "بحث",
                  // onPressed: () {
                  //   navigateTo(context, DiagnosticAllSpecialists()
                  //   );
                 // },
                ),
              ]),
        ),
      ),
    );
  }
}
