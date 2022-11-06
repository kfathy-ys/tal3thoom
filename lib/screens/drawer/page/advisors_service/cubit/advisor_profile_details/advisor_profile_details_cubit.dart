import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../models/advisor_model.dart';

part 'advisor_profile_details_state.dart';

class AdvisorProfileDetailsCubit extends Cubit<AdvisorProfileDetailsState> {
  int? profileId;

  AdvisorProfileDetailsCubit() : super(AdvisorProfileDetailsLoading()){
    getAdvisorsProfileDetails(id: 3);
  }

  Future<void> getAdvisorsProfileDetails({required int id}) async {
    emit(AdvisorProfileDetailsLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'Specialist/getSpecialistId/$id');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }
 final x= AdvisorProfile.fromMap(res.data);
      print("eeeeeeeeeeeeeeeeeee"+x.toString());
      emit(AdvisorProfileDetailsSuccess(advisorProfile:x ));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AdvisorProfileDetailsError(msg: e.toString()));
    }
  }
}
