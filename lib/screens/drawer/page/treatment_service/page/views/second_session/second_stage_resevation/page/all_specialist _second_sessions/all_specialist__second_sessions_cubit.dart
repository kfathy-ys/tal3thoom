import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../../home/pages/views/reservations_schedule/view.dart';
import '../../../../../../../../../widgets/alerts.dart';
import '../../../../../../../../../widgets/date_convertors.dart';
import '../../../../../../../diagnostic_service/page/views/resevation_diagnostic/page/all_specialists/models/all_specialist_model.dart';

part 'all_specialist__second_sessions_state.dart';

class AllSpecialistSecondSessionsCubit
    extends Cubit<AllSpecialistSecondSessionsState> {
  AllSpecialistSecondSessionsCubit()
      : super(AllSpecialistSecondSessionsInitial());

  Future<void> getSpecialistsSecondStage(
      {required String startTime, required String date}) async {
    emit(AllSpecialistSecondSessionsLoading());
    try {
      final res = await NetWork.get(
          'Booking/GetSpecialistByDateAndTime/M/$startTime/${DateConverter.dateConverterOnlys(date.toString())}');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(AllSpecialistSecondSessionsSuccess(
        allSpecialistModel: AllSpecialistModel.fromMap(res.data),
      ));

      if (res.data['status'] == 1) {
        Alert.success('تم الحجز مع المتخصص بنجاح',
            desc:
                "زر الحجز مع الأخصائي المختص لن يتم تفعلية مع نفس الأخصائي الا بعد مرور 7 أيام من الموعد");
        Get.offAll(() => const ReservationsSchedule());
      }
      if (res.data['status'] == 2) {
        Alert.error('تم الحجز مع المتخصص من قبل بنجاح',
            desc: "عذراً..لايمكنك الحجز يجيب انهاء الاختبارا");
      }
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      Alert.error(e.toString());
      emit(AllSpecialistSecondSessionsError(msg: e.toString()));
    }
  }

  Future<void> secondStagesSessionsCreateReservation(
      {required int specialistId}) async {
    try {
      final userId = Prefs.getString("userId");

      final res = await NetWork.post(
        'Booking/booked/$specialistId/$userId',
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(AllSpecialistSecondSessionsSuccess(
          allSpecialistModel: AllSpecialistModel.fromMap(res.data)));

      if (res.data['status'] == 1) {
        Alert.success('تم الحجز مع المتخصص بنجاح',
            desc:
                "زر الحجز مع الأخصائي المختص لن يتم تفعلية مع نفس الأخصائي الا بعد مرور 7 أيام من الموعد");
        //Get.offAll(() => const ReservationsSchedule());
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
      emit(AllSpecialistSecondSessionsError(msg: e.toString()));
    }
  }
}
