import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../config/dio_helper/dio.dart';
import '../../../widgets/alerts.dart';
import '../model/delet_account_model.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountInitial());

  final userId = Prefs.getString("userId");
  final passwordController = TextEditingController();

  Future<Messages?> deleteAccount({required String password}) async {
    emit(DeleteAccountLoading());
    try {
      final res = await NetWork.post(
        'Patients/deleteAcc',
        body: {"userId": userId, "password": password},
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        // throw res.data['messages']['body'];
        final _msg = Messages.fromJson(res.data['messages'][0]);
        //  throw _msg;
        print("errrrrrrrrrrro" + _msg.toString());
      }

      emit(DeleteAccountSuccess(allMessages: AllMessages.fromJson(res.data)));
      Alert.success("تم حذف الحساب بنجاح");

      Future.delayed(const Duration(seconds: 4));

      Prefs.clear();
      exit(0);
    } catch (e, st) {
      // Alert.success(res.data['messages']['title'].toString());
      Alert.error("عفوا ! كلمة المرور غير صحيحة",
          desc:
              "الرجاء التاكد من البيانات المطلوبة حرصا منا علي سلامة بيانتكم والحفاظ عليها ");

      log(e.toString());
      log(st.toString());
      emit(DeleteAccountError(msg: e.toString()));
    }
    return null;
  }
}
