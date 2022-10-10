import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/alerts.dart';
import '../models/booking_model.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {


  BookingCubit() : super(BookingInitial()){
    getBookingList();
  }


  var userId = Prefs.getString("userId");
  List <AllBookingModel> allSectionSNotes =[];

  Future<void> getBookingList() async {


    emit(BookingLoading());
    try {
      allSectionSNotes.clear();
      final userId = Prefs.getString("userId");
      final res =
      await NetWork.get('Patients/getPatientBooking/$userId/1/100');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(BookingSuccess(bookingInfo:AllBookingModel.fromMap(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(BookingError(msg: e.toString()));
    }
  }


  Future<void> removeFromBooking({
    required String startTime,
    required String endTime,
    required String day,
    required String availableDateTime,
    required int idScheduleDetails,
    required String sessienUrl,
    required int specialistRate,
    required String zoomInvitationUrl,
    required String scheduledFor,

  }) async {
    try {
      final body = {
        "status": null,
        "startTime": startTime,
        "endTime": endTime,
        "day": day,
        "availableDateTime": availableDateTime,
        "fullName": null,
        "idScheduleDetails": idScheduleDetails,
        "userId": userId,
        "specialistGender": null,
        "sessienUrl": sessienUrl,
        "specialistRate": specialistRate,
        "zoomInvitationUrl":zoomInvitationUrl,
        "scheduledFor": scheduledFor,
        "patientDiagnosesStatus": null
      };
      final res = await NetWork.post('Patients/cancelBooking', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(BookingSuccess(bookingInfo: AllBookingModel.fromMap(res.data)));
      await getBookingList();
      Alert.success("عملية ناجحة",desc: "تم إالغاء الحجز بنجاح",);
      print("ovhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      print("فشلللللللللللللللللللللللل");

      emit(BookingError(msg: e.toString()));
    }
  }
}
