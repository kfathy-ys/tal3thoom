import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../auth/register/page/hint_avaliable_time.dart';
import '../../../../../../../home/pages/views/reservations_schedule/page/views/avaliable_time.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/fast_widget.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/resevation_diagnostic/models/avalible_periods_model.dart';
import 'cubit/first_available_dates_cubit.dart';
import 'page/all_specialist _first_sessions/view.dart';

// ignore: must_be_immutable
class FirstStageTreatmentReservation extends StatelessWidget {
  FirstStageTreatmentReservation({Key? key}) : super(key: key);
  AvailablePeriods? availablePeriods;
  String? selectedPeriodId;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
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
          child:
              BlocConsumer<FirstAvailableDatesCubit, FirstAvailableDatesState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<FirstAvailableDatesCubit>(context);
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTileContainer(
                        widthh: context.width / 2,
                        title: "حجز موعد مع المختص",
                        context: context),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4),
                      child: Image.asset(
                        "assets/images/boxnew.png",
                      ),
                    ),

                    state is! FirstAvailableDatesLoading
                        ? Container(
                            height: context.height * 0.35,
                            width: context.width * 0.8,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 14),
                            decoration: BoxDecoration(
                                border: Border.all(color: kSafeAreasColor),
                                color: kHomeColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8)),
                            child: CalendarDatePicker(
                              firstDate: DateTime.now(),

                            //initialDate:  DateTime.now().add(Duration(days: 1)),
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2031),
                              onDateChanged: (value) {
                                selectedDate = value;
                                cubit.getAvailablePeriodsFirstStage(
                                    selectedDate: value);
                              },
                              selectableDayPredicate: (day) {
                                if (cubit.dates.isNotEmpty) {
                                  if (cubit.dates.contains(day)) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                } else {
                                  return true;
                                }
                              },
                            ),
                          )
                        : const LoadingFadingCircleSmall(),
                    // DropDownSix(onChanged: (value) {
                    //   //  cubit.getAvailableDatesDiagnostic();
                    //   cubit.onSexTypeChanged(value);
                    // }),
                    customText9(
                        title: "تم إغلاق جميع الايام الغير متاح بيها مواعيد ",
                        color: kButtonDashBoard),
                    const HintAvailableTime(),
                    state is! FirstAvailableDatesLoading
                        ? AvailableTime(
                            onSelect: (String x) {
                              selectedPeriodId = x;
                              print("Khallllllllled" +
                                  selectedPeriodId.toString());
                            },
                            periods: cubit.periods,
                          )
                        : const LoadingFadingCircleSmall(),
                    cubit.periods.isEmpty
                        ? Center(
                            child: customText3(
                                title: "لا توجد فترات متاحة الان",
                                color: kBlackText),
                          )
                        : const SizedBox.shrink(),

                    SmallButton(
                      title: "بحث",
                      onPressed: () {
                        navigateTo(
                            context,
                            AllSpecialistsFirstSessions(
                                startTime: selectedPeriodId!,
                                date: selectedDate!));
                      },
                    )
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
