import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../drawer/view.dart';
import '../home/pages/views/reservations_schedule/page/views/reservation_card.dart';
import '../widgets/appBar.dart';
import '../widgets/constants.dart';
import '../widgets/date_convertors.dart';
import '../widgets/loading.dart';
import 'cubit/finished_sessions_cubit.dart';

class FinishedSessions extends StatefulWidget {
  const FinishedSessions({Key? key}) : super(key: key);

  @override
  State<FinishedSessions> createState() => _FinishedSessionsState();
}

class _FinishedSessionsState extends State<FinishedSessions> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            CustomTileContainer(
                widthh: context.width * 0.7,
                title: " جدول الحجوزات المنتهية",
                context: context),
            BlocConsumer<FinishedSessionsCubit, FinishedSessionsState>(
              listener: (context, state) {},
              builder: (context, state) {
                final cubit = BlocProvider.of<FinishedSessionsCubit>(context);
                if (state is FinishedSessionsLoading) {
                  return const LoadingFadingCircle();
                }
                if (state is FinishedSessionsSuccess) {
                  return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          cubit.getFinishedBookingList();
                          return Future<void>.delayed(const Duration(seconds: 3));
                        },
                        backgroundColor: kAccentColor,
                        color: Colors.white,
                        child: state.bookingInfo.data.isEmpty
                            ? Center(
                            child: customBoldText(
                                title: "لا توجد حجوزات منتهية الاّن",
                                color: kBlackText))
                            : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: state.bookingInfo.dataLength,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return FadeInUpBig(
                              child: ReservationFinishedCard(


                                  subTitleData: DateConverter.dateConverterMonth(state
                                      .bookingInfo
                                      .data[index]
                                      .availableDateTime),
                                  subTitleDay: state.bookingInfo.data[index].day
                                      .toString(),
                                  subTitleStartSessionData: state
                                      .bookingInfo.data[index].startTime
                                      .toString(),
                                  subTitleFinishSessionDate: state
                                      .bookingInfo.data[index].endTime
                                      .toString(),
                                  subTitleTypeAppointment: state.bookingInfo
                                      .data[index].scheduledFor
                                      .toString() ==
                                      "Consult"
                                      ? "جلسة إستشارية"
                                      : state.bookingInfo.data[index].scheduledFor.toString() ==
                                      "Diagnosis"
                                      ? "جلسة تشخيصية"
                                      : state.bookingInfo.data[index].scheduledFor.toString() ==
                                      "Treatment"
                                      ? "جلسة علاجية"
                                      : state.bookingInfo.data[index].scheduledFor.toString() ==
                                      "DiagnosisAndTreatment"
                                      ? "جلسة تشخيصية/ علاجية"
                                      : "",
                                  subTitleEvaluation: state.bookingInfo.data[index].specialistRate == 1
                                      ? "⭐"
                                      : state.bookingInfo.data[index].specialistRate == 2
                                      ? "⭐⭐"
                                      : state.bookingInfo.data[index].specialistRate == 3
                                      ? "⭐⭐⭐"
                                      : state.bookingInfo.data[index].specialistRate == 4
                                      ? "⭐⭐⭐⭐"
                                      : ""),
                            );
                          },
                        ),
                      ));
                }
                if (state is FinishedSessionsError) {
                  return Text(state.msg);
                }

                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
