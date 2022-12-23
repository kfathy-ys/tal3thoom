import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:dio/dio.dart' as _dio;

import '../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../../serives/second_stage_inject/sessions/behavioral_section/question_serives.dart';
import '../../../../../../../../widgets/alerts.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

part 'second_behavioral_state.dart';

class SecondBehavioralCubit extends Cubit<SecondBehavioralState> {
  SecondBehavioralCubit() : super(SecondBehavioralInitial()) {
    getSecondBehavioralSection();
  }

  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};

  Future<void> getSecondBehavioralSection() async {
    emit(SecondBehavioralLoading());
    try {
      questionList.assignAll(await SecondBehavioralSectionService.findMany());

      print(questionList);
      answer.clear();

      emit(SecondBehavioralSuccess(behavioralSection: questionList));
    } on DioError catch (_) {
      emit(SecondBehavioralError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      print("err");
      log(e.toString());
      log(es.toString());
      emit(SecondBehavioralError(msg: e.toString()));
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
    emit(SecondBehavioralLoading());

    try {
      final body = formData;
      final res = await NetWork.post(
          'PatientExams/AddPatienVideoExamAnswer/$userId/$examId/$questionId/4',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(SecondBehavioralSuccess(behavioralSection: questionList));
      Alert.success('تم رفع الفيديو بنجاح');
    } on DioError catch (_) {
      emit(SecondBehavioralError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(SecondBehavioralError(msg: e.toString()));
    }
  }
}
