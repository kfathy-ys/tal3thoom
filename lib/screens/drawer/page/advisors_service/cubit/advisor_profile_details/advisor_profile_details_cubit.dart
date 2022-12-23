import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../models/profile_dtails.dart';

part 'advisor_profile_details_state.dart';

class AdvisorProfileDetailsCubit extends Cubit<AdvisorProfileDetailsState> {
  String? userProfileId;
  AdvisorProfileDetailsCubit() : super(AdvisorProfileDetailsLoading());

  // {
  //   getAdvisorsProfileDetails(userProfileId: userProfileId!);
  // }

  Future<void> getAdvisorsProfileDetails(
      {required String userProfileId}) async {
    emit(AdvisorProfileDetailsLoading());
    try {
      final res =
          await NetWork.get('Specialist/SpecialistByUserId/$userProfileId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }
      print("eeeeeeeeeeeeeeeeeee" + res.data.toString());

      final x = AdvisorProfile.fromJson(res.data['data']);
      emit(AdvisorProfileDetailsSuccess(advisorProfile: x));
    } on DioError catch (_) {
      emit(AdvisorProfileDetailsError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AdvisorProfileDetailsError(msg: e.toString()));
    }
  }
}
