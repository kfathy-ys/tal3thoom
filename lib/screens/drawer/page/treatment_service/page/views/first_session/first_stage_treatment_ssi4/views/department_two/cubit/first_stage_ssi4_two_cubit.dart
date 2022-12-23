import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart' as _dio;

import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../../../../serives/first_stage_injects/first_stage_ssi4/quesyion_two.dart';
import '../../../../../../../../../../widgets/alerts.dart';
import '../../../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

part 'first_stage_ssi4_two_state.dart';

class FirstStageSsi4TwoCubit extends Cubit<FirstStageSsi4TwoState> {
  FirstStageSsi4TwoCubit() : super(FirstStageSsi4TwoInitial()) {
    getSSI4SecondStageQuestions();
  }

  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};

  Future<void> getSSI4SecondStageQuestions() async {
    emit(FirstStageSsi4TwoLoading());
    try {
      questionList
          .assignAll(await Ssi4FirstQuestionSecondService.findManySecondSsi4());

      print(questionList);

      emit(FirstStageSsi4TwoSuccess(ssi4QuestionModel: questionList));
    } on DioError catch (_) {
      emit(FirstStageSsi4TwoError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      print("err");
      log(e.toString());
      log(es.toString());
      emit(FirstStageSsi4TwoError(msg: e.toString()));
    }
  }

  Future<void> postUploadVideoSSI4SecondStage({
    required int id,
    required int examId,
    required dynamic video,
  }) async {
    final formData = _dio.FormData.fromMap({
      "record":
          _dio.MultipartFile.fromFileSync(video.path, filename: video.path),
    });
    try {
      final body = formData;
      final res = await NetWork.post(
          'PatientExams/AddPatientSSI4ExamAnswers/$userId/$examId/$id/2',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(FirstStageSsi4TwoSuccess(ssi4QuestionModel: questionList));
      Alert.success('تم رفع الفيديو بنجاح');
    } on DioError catch (_) {
      emit(FirstStageSsi4TwoError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(FirstStageSsi4TwoError(msg: e.toString()));
    }
  }
}
