import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../config/dio_helper/dio.dart';
import '../../../widgets/alerts.dart';
import '../models/forget_passsword_model.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  final emailController = TextEditingController();

  Future<void> forgetPassword({
    required String email,
  }) async {
    emit(ForgetPasswordLoading());
    try {
      final res = await NetWork.post(
        'Patients/GenerateForgetPasswordCode',
        body: {
          "email": email,
        },
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(ForgetPasswordSuccess(
          forgetPasswordModel: ForgetPasswordModel.fromJson((res.data))));
    } on DioError catch (_) {
      emit(ForgetPasswordError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      Alert.error(e.toString());
      log(e.toString());
      log(st.toString());
      emit(ForgetPasswordError(msg: e.toString()));
    }
  }
}
