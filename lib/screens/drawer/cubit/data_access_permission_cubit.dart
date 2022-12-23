import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../config/dio_helper/dio.dart';
import '../models/model.dart';

part 'data_access_permission_state.dart';

class DataAccessPermissionCubit extends Cubit<DataAccessPermissionState> {
  DataAccessPermissionCubit() : super(DataAccessPermissionInitial()) {
    getAccessPermission();
  }
  Future<void> getAccessPermission() async {
    emit(DataAccessPermissionLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Stages/GetPatientStagesMobile/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(DataAccessPermissionSuccess(
          accessPermissionModel: DataAccessPermissionModel.fromJson(res.data)));
    } on DioError catch (_) {
      emit(DataAccessPermissionError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(DataAccessPermissionError(msg: e.toString()));
    }
  }
}
