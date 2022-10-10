import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../config/dio_helper/dio.dart';
import '../../home/pages/views/profile/models/profile_model.dart';
import '../../widgets/alerts.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {

  UpdateProfileCubit() : super(UpdateProfileInitial());

  final phoneController = TextEditingController();

  final emailController = TextEditingController();
  final dadNameController = TextEditingController();
  final familyNameControlller = TextEditingController();
  final countryPhoneCode = TextEditingController();

  final firstNameController = TextEditingController();
  final nationality = TextEditingController();
  final city = TextEditingController();

  final sexController = TextEditingController();
  final idCardNumber = TextEditingController();
  final countryController = TextEditingController();

  final entityNumberController = TextEditingController();

  final entityWorkController = TextEditingController();

  final cityController = TextEditingController();
  final dateController = TextEditingController();
  final userId = Prefs.getString("userId");
  String? typeSexId;
  String onSexTypeChanged(String value) => typeSexId = value;
  String? typeReadId;
  String onReadTypeChanged(String value) => typeReadId = value;
  Future<void> updateProfile({
    required int id,
    required String firstName,
    required String middleName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String countryPhoneCode,
    required String birthDate,
    required String nationality,
    required String idCardNumber,

    required String country,
    required String city,
    required String workPlace,
  }) async {
    emit(UpdateProfileLoading());
    try {
      final res = await NetWork.post(
        'Patients/UpdatePatient',
        body: {
          "id": id,
          "firstName": firstName,
          "middleName": middleName,
          "lastName": lastName,
          "email": email,
          "phoneNumber": phoneNumber,
          "countryPhoneCode":countryPhoneCode,
          "gender": typeSexId,
          "birthDate": "2022-10-10",
          "nationality": nationality,
          "idCardNumber": idCardNumber,
          "country": country,
          "city": city,
          "userId": userId,

          "workPlace": workPlace,
          "type": typeReadId
        },
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        //throw res.data['message'];
        Alert.error("يجب إكمال الحقول المطلوبة");
      }

      emit(UpdateProfileSuccess(profileModel: AllProfile.fromMap(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(UpdateProfileError(msg: e.toString()));
    }
  }
}
