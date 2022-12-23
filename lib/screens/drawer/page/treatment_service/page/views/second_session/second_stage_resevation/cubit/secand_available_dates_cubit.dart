import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tal3thoom/screens/widgets/date_convertors.dart';

import '../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../diagnostic_service/page/views/resevation_diagnostic/models/avalible_periods_model.dart';
import '../../../../../../diagnostic_service/page/views/resevation_diagnostic/models/diagnostic_reservation_available_dates_model.dart';

part 'first_available_dates_state.dart';

class SecondAvailableDatesCubit extends Cubit<SecondAvailableDatesState> {
  SecondAvailableDatesCubit() : super(SecondAvailableDatesInitial()) {
    getAvailableDatesSecondStage();
  }

  String? typeSexId;
  String onSexTypeChanged(String value) => typeSexId = value;

  final dates = <DateTime>[];
  final availableDates = <DateTime>[];
  int visitDateId = 0;

  Future<void> getAvailableDatesSecondStage() async {
    emit(SecondAvailableDatesLoading());
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
          .map((e) => dates.add(DateTime(e["year"], e["month"], e["day"])))
          .toList();

      emit(SecondAvailableDatesSuccess(
        availableDatesModel:
            DiagnosticReservationAvailableDateModel.fromMap(res.data),
        dates: dates,
      ));
    } on DioError catch (_) {
      emit(SecondAvailableDatesError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(SecondAvailableDatesError(msg: e.toString()));
    }
  }

  final periods = <AvailablePeriods>[];
  Future<void> getAvailablePeriodsSecondStage({
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
    } on DioError catch (_) {
      emit(AvailablePeriodError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AvailablePeriodError(msg: e.toString()));
    }
  }
}
