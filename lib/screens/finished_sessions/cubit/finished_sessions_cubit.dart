import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../config/dio_helper/dio.dart';
import '../../home/pages/views/reservations_schedule/models/booking_model.dart';

part 'finished_sessions_state.dart';

class FinishedSessionsCubit extends Cubit<FinishedSessionsState> {
  FinishedSessionsCubit() : super(FinishedSessionsInitial()){
    getFinishedBookingList();
  }



  var userId = Prefs.getString("userId");
  List<AllBookingModel> allSectionSNotes = [];

  Future<void> getFinishedBookingList() async {
    emit(FinishedSessionsLoading());
    try {
      allSectionSNotes.clear();
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Patients/getPatientPreviousBooking/$userId/1/100');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(FinishedSessionsSuccess(bookingInfo: AllBookingModel.fromMap(res.data)));
    } on DioError catch (_) {
      emit(FinishedSessionsError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(FinishedSessionsError(msg: e.toString()));
    }
  }
}
