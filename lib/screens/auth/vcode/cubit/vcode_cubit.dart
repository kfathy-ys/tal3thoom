import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../config/dio_helper/dio.dart';
import '../../forget_password/models/forget_passsword_model.dart';

part 'vcode_state.dart';

class VcodeCubit extends Cubit<VcodeState> {
  VcodeCubit() : super(VcodeInitial());

  final pinCodeController = TextEditingController();

  Future<void> vCode({
    required String email,
    required String code,
  }) async {
    emit(VcodeILoading());
    try {
      final res = await NetWork.post(
        'Patients/AddForgetPasswordByCode',
        body: {"email": email, "password": null, "code": code},
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(VcodeSuccess(
          forgetPasswordModel: ForgetPasswordModel.fromJson((res.data))));
    } catch (e, st) {
      final res = await NetWork.post(
        'Patients/GenerateVcodeCode',
        body: {
          "email": email,
        },
      );
      log(e.toString());
      log(st.toString());
      emit(VcodeError(msg: res.data["messages"][0]["title"].toString()));
    }
  }
}
