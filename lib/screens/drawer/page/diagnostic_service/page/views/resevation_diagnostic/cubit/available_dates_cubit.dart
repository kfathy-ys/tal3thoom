import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tal3thoom/config/dio_helper/dio.dart';

import '../../../../../../../widgets/date_convertors.dart';
import '../models/avalible_periods_model.dart';
import '../models/diagnostic_reservation_available_dates_model.dart';

part 'available_dates_state.dart';

class AvailableDatesCubit extends Cubit<AvailableDatesState> {
  AvailableDatesCubit() : super(AvailableDatesInitial()){
    getAvailableDatesDiagnostic();
  }


  String? typeSexId;
  String onSexTypeChanged(String value) => typeSexId = value;


  final dates = <DateTime>[];
  final availableDates = <DateTime>[];
  int visitDateId = 0;

  Future<void> getAvailableDatesDiagnostic() async {
    emit(AvailableDatesLoading());
    try {
      dates.clear();
      final res = await NetWork.get(
          'Booking/GetScheduleListOfDates/DiagnosisAndTreatment');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      (res.data['data'] as List)
          .map((e) => dates.add(DateTime(e["year"],e["month"],e["day"])))
          .toList();


      emit(AvailableDatesSuccess(
        availableDatesModel: DiagnosticReservationAvailableDateModel.fromMap(res.data),
        dates: dates,
      ));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AvailableDatesError(msg: e.toString()));
    }
  }

  final periods = <AvailablePeriods>[];
  Future<void> getAvailablePeriodsDiagnostic({
    required DateTime selectedDate,
  }) async {
    emit(AvailablePeriodLoading());
    try {
      periods.clear();
      final res = await NetWork.get(
          'Booking/getTimeByDateSchedule/${DateConverter.dateConverterOnlys(selectedDate.toString())}');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      (res.data['data'] as List)
          .map((e) => periods.add(AvailablePeriods.fromMap(e)))
          .toList();

      emit(AvailablePeriodSuccess());
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AvailablePeriodError(msg: e.toString()));
    }
  }

}
