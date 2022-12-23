import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';
import '../../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../../widgets/alerts.dart';
import '../../../../../../../../../widgets/date_convertors.dart';
import '../models/all_specialist_model.dart';

part 'diangosic_specialists_state.dart';

class DiagnosticSpecialistsCubit extends Cubit<DiagnosticSpecialistsState> {
  DiagnosticSpecialistsCubit() : super(DiagnosticSpecialistsInitial());

  Future<void> getSpecialists(
      {required String startTime, required String date}) async {
    emit(DiagnosticSpecialistsLoading());
    try {
      final res = await NetWork.get(
          'Booking/GetSpecialistByDateAndTime/M/$startTime/${DateConverter.dateConverterOnlys(date.toString())}');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(DiagnosticSpecialistsSuccess(
        allSpecialistModel: AllSpecialistModel.fromMap(res.data),
      ));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(DiagnosticSpecialistsError(msg: e.toString()));
    }
  }

  Future<void> diagnosticCreateReservation({required int specialistId}) async {
    try {
      final userId = Prefs.getString("userId");

      final res = await NetWork.post(
        'Booking/booked/$specialistId/$userId',
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(DiagnosticSpecialistsSuccess(
          allSpecialistModel: AllSpecialistModel.fromMap(res.data)));

      if (res.data['status'] == 1) {
        Alert.success('تم الحجز مع المتخصص بنجاح',
            desc:
                "زر الحجز مع الأخصائي المختص لن يتم تفعلية مع نفس الأخصائي الا بعد مرور 7 أيام من الموعد");

        // Get.offAll(() => const ReservationsSchedule());
      }
      if (res.data['status'] == 2) {
        Alert.error('تم الحجز مع المتخصص من قبل بنجاح',
            desc: "عذراً..لايمكنك الحجز يجيب انهاء الاختبارا");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Alert.error(
        e.toString(),
      );
      emit(DiagnosticSpecialistsError(msg: e.toString()));
    }
  }
}
