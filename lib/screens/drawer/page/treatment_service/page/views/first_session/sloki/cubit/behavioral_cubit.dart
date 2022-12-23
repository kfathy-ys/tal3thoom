import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart' as _dio;

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import 'package:tal3thoom/serives/first_stage_injects/sessions/behavioral_section/question_serives.dart';

import '../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../widgets/alerts.dart';

part 'behavioral_state.dart';

class BehavioralCubit extends Cubit<BehavioralState> {
  BehavioralCubit() : super(BehavioralInitial()) {
    getBehavioralSection();
  }

  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};

  Future<void> getBehavioralSection() async {
    emit(BehavioralLoading());
    try {
      questionList.assignAll(await BehavioralSectionService.findMany());

      print(questionList);
      answer.clear();

      emit(BehavioralSuccess(behavioralSection: questionList));
    } on DioError catch (_) {
      emit(BehavioralError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      print("err");
      log(e.toString());
      log(es.toString());
      emit(BehavioralError(msg: e.toString()));
    }
  }

  Future<void> postUploadVideo({
    required int questionId,
    required int examId,
    required dynamic video,
  }) async {
    final formData = _dio.FormData.fromMap({
      "record":
          _dio.MultipartFile.fromFileSync(video.path, filename: video.path),
    });
    // questionList.clear();
    emit(BehavioralLoading());

    try {
      final body = formData;
      final res = await NetWork.post(
          'PatientExams/AddPatienVideoExamAnswer/$userId/$examId/$questionId/2',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(BehavioralSuccess(behavioralSection: questionList));
      Alert.success('تم رفع الفيديو بنجاح');
      // Timer(const Duration(seconds: 10), () {
      //
      // });

    } on DioError catch (_) {
      emit(BehavioralError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(BehavioralError(msg: e.toString()));
    }
  }
}
