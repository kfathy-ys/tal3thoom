import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../config/dio_helper/dio.dart';
import '../../../widgets/alerts.dart';
import '../../forget_password/models/forget_passsword_model.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordInitial());

  final pinCodeController = TextEditingController();

  Future<void> createNewPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    emit(NewPasswordLoading());
    try {
      final res = await NetWork.post(
        'Patients/AddForgetPasswordByCode',
        body: {"email": email, "password": password, "code": code},
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(NewPasswordSuccess(
          forgetPasswordModel: ForgetPasswordModel.fromJson((res.data))));
    } catch (e, st) {
      Alert.error("يجب الحصول علي تصريح الوصول الي الخزينة");

      log(e.toString());
      log(st.toString());
      emit(NewPasswordError(msg: e.toString()));
    }
  }
}
