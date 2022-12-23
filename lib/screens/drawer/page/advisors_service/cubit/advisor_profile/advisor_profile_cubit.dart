import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../models/advisor_model.dart';
import '../../models/all_reservation_advisors_model.dart';

part 'advisor_profile_state.dart';

class AdvisorProfileCubit extends Cubit<AdvisorProfileState> {
  AdvisorProfileCubit() : super(AdvisorProfileInitial());

  AllAdvisors? selectedAdvisor;
  void onAdvChange(AllAdvisors value) => selectedAdvisor = value;

  int? selectedTime;
  void onTimeChange(int value) => selectedTime = value;

  String? selectedDates;
  void onDatesChange(String value) => selectedDates = value;

  List<AllReservationsAdvisorModel> allReservationsAdvisorModel = [];

  Future<void> getAllAdvisors(
      {required int userProfileId, required int time, required data}) async {
    emit(AllAdvisorToReservedLoading());
    try {
      allReservationsAdvisorModel.clear();
      final res = await NetWork.get(
          'Schedule/GetScheduleDetailsBySpecialistIdAndSessionDurationAndSessionDate/$userProfileId/$time/$data/Consult');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      print("before " "${AllReservationsAdvisorModel.fromJson(res.data)}");

      emit(AllAdvisorToReservedSuccess(
          allAdvisorToReservedModel:
              AllReservationsAdvisorModel.fromJson(res.data)));

      print("after " "${AllReservationsAdvisorModel.fromJson(res.data)}");
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AllAdvisorToReservedError(msg: e.toString()));
    }
  }
}
