import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../config/dio_helper/dio.dart';
import '../../../../widgets/alerts.dart';
import '../model/previous_model.dart';

part 'previous_sessions_state.dart';

class PreviousSessionsCubit extends Cubit<PreviousSessionsState> {
  PreviousSessionsCubit() : super(PreviousSessionsInitial());
  String? typeSessionId;
  String onSessionTypeChanged(String value) => typeSessionId = value;

  final formKey = GlobalKey<FormState>();

  final questionList = <Question>[];

  final answer = <Question, Answers>{};

  Future<void> getPreviousAnswers({required String sessionNumber}) async {
    emit(PreviousSessionsLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'PatientExamResult/GetPatientExamResultByExameCodeMobile/$userId/$sessionNumber');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        Alert.error(res.data['messages'][0]['title']);
        print("rrrrrrrrr" + res.data['messages'][0]['title'].toString());
        throw res.data['messages'][0]['title'];
      }
      var x = PreviousAnswersModel.fromJson(res.data);
      print(x.toJson());
      emit(PreviousSessionsSuccess(
          previousAnswersModel: PreviousAnswersModel.fromJson(res.data)));
    } on DioError catch (_) {
      emit(PreviousSessionsError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      Alert.error("لم يتم اخذ الجلسة بعد",
          desc: "يجب اجتياز بعض المراحل العلاجية ");
      log(es.toString());
      emit(PreviousSessionsError(msg: e.toString()));
    }
  }
}
