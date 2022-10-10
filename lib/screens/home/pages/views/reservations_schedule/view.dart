import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/screens/home/pages/views/reservations_schedule/page/views/reservation_card.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../widgets/alerts.dart';
import '../../../../widgets/constants.dart';
import '../../../../widgets/date_convertors.dart';
import '../../../../widgets/fast_widget.dart';
import '../../../../widgets/loading.dart';
import 'cubit/booking_cubit.dart';

// ignore: must_be_immutable
class ReservationsSchedule extends StatefulWidget {
  const ReservationsSchedule({Key? key}) : super(key: key);

  @override
  State<ReservationsSchedule> createState() => _ReservationsScheduleState();
}

class _ReservationsScheduleState extends State<ReservationsSchedule> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kHomeColor,
      child: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            CustomTileContainer(
                widthh: context.width * 0.5,
                title: "جدول الحجوزات",
                context: context),
            BlocConsumer<BookingCubit, BookingState>(
              listener: (context, state) {},
              builder: (context, state) {
                final cubit = BlocProvider.of<BookingCubit>(context);
                if (state is BookingLoading) {
                  return const LoadingFadingCircle();
                }
                if (state is BookingSuccess) {
                  return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          cubit.getBookingList();
                          return Future<void>.delayed(
                              const Duration(seconds: 3));
                        },
                        backgroundColor: kAccentColor,
                        color: Colors.white,
                        child: state.bookingInfo.data.isEmpty
                            ? Center(
                            child: customBoldText(
                                title: "لا توجد حجوزات الاّن",
                                color: kBlackText))
                            : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: state.bookingInfo.dataLength,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ReservationCard(
                                onPressStart: () {
                                  state.bookingInfo.data[index].sessienUrl
                                      .isEmpty
                                      ? Alert.success(
                                    " 'عزيزي العميل الرجاء الإنتظار!'",
                                    desc: "هذا الاجتماع مؤجل لحين مراجعة البيانات",
                                  )
                                      : navigateTo(
                                      context,
                                      WebView(
                                        javascriptMode:
                                        JavascriptMode.unrestricted,
                                        initialUrl: state.bookingInfo
                                            .data[index].sessienUrl,
                                      ));
                                },
                                onPressEnd: () {
                                  cubit.removeFromBooking(
                                    startTime: state
                                        .bookingInfo.data[index].startTime,
                                    endTime:
                                    state.bookingInfo.data[index].endTime,
                                    day: state.bookingInfo.data[index].day,
                                    availableDateTime: state.bookingInfo
                                        .data[index].availableDateTime,
                                    idScheduleDetails: state.bookingInfo
                                        .data[index].idScheduleDetails,
                                    sessienUrl: state
                                        .bookingInfo.data[index].sessienUrl,
                                    specialistRate: state.bookingInfo
                                        .data[index].specialistRate,
                                    zoomInvitationUrl: state.bookingInfo
                                        .data[index].zoomInvitationUrl,
                                    scheduledFor: state
                                        .bookingInfo.data[index].scheduledFor,
                                  );
                                  // Alert.error("عملية ناجحة",desc: "تم إالغاء الحجز بنجاح",);

                                },
                                subTitleData: DateConverter.dateConverterMonth(
                                    state
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
                                    : state.bookingInfo.data[index].scheduledFor
                                    .toString() ==
                                    "Diagnosis"
                                    ? "جلسة تشخيصية"
                                    : state.bookingInfo.data[index].scheduledFor
                                    .toString() ==
                                    "Treatment"
                                    ? "جلسة علاجية"
                                    : state.bookingInfo.data[index].scheduledFor
                                    .toString() ==
                                    "DiagnosisAndTreatment"
                                    ? "جلسة تشخيصية/ علاجية"
                                    : "",
                                subTitleEvaluation: state.bookingInfo
                                    .data[index].specialistRate == 1
                                    ? "⭐"
                                    : state.bookingInfo.data[index]
                                    .specialistRate == 2
                                    ? "⭐⭐"
                                    : state.bookingInfo.data[index]
                                    .specialistRate == 3
                                    ? "⭐⭐⭐"
                                    : state.bookingInfo.data[index]
                                    .specialistRate == 4
                                    ? "⭐⭐⭐⭐"
                                    : "");
                          },
                        ),
                      ));
                }
                if (state is BookingError) {
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
