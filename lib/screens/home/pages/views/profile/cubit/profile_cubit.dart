import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/alerts.dart';
import '../models/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    getProfile();
  }

  final phoneController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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

  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Patients/GetById/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(ProfileSuccess(profileModel: ProfileModel.fromMap(res.data)));

      ProfileModel loginModel = ProfileModel.fromMap((res.data));

      Prefs.setString("fullName", loginModel.data.fullName);
      Prefs.setString("email", loginModel.data.email);
      Prefs.setString("phoneNumber", loginModel.data.phoneNumber);

      Prefs.setString("country", loginModel.data.country);
      Prefs.setString("workPlace", loginModel.data.workPlace);
      Prefs.setString("birthDate", loginModel.data.birthDate);
      Prefs.setString("city", loginModel.data.city);
      Prefs.setString("gender", loginModel.data.gender);
      Prefs.setString("idCardNumber", loginModel.data.idCardNumber);
      Prefs.setString("type", loginModel.data.type);
      Prefs.setString("currentStage", loginModel.data.currentStage.toString());
      Prefs.setString(
          "currentDiagnoses", loginModel.data.currentDiagnoses.toString());
      Prefs.setString("currentDiagnosesStatus",
          loginModel.data.currentDiagnosesStatus.toString());
      Prefs.setString("nextSession", loginModel.data.nextSession.toString());

      log("${res.data["data"]["userId"]}");

      log("${res.data["data"]["fullName"]}");
      log("${res.data["data"]["email"]}");
      log("${res.data["data"]["phoneNumber"]}");

      log("${res.data["data"]["currentStage"]}");
      log("${res.data["data"]["currentDiagnoses"]}");
      log("${res.data["data"]["currentDiagnosesStatus"]}");
      log("${res.data["data"]["nextSession"]}");
    } on DioError catch (_) {
      emit(ProfileError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(ProfileError(msg: e.toString()));
    }
  }

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
    emit(ProfileLoading());
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
          "countryPhoneCode": countryPhoneCode,
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

      emit(ProfileSuccess(profileModel: ProfileModel.fromMap(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ProfileError(msg: e.toString()));
    }
  }
}
