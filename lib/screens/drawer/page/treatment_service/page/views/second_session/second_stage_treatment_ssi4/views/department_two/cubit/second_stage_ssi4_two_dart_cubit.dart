import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:dio/dio.dart' as _dio;

import '../../../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../../../../serives/second_stage_inject/second__stage_ssi4_one/question2.dart';
import '../../../../../../../../../../widgets/alerts.dart';
import '../../../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

part 'second_stage_ssi4_two_dart_state.dart';

class SecondStageSsi4TwoDartCubit extends Cubit<SecondStageSsi4TwoDartState> {
  SecondStageSsi4TwoDartCubit() : super(SecondStageSsi4TwoDartInitial()) {
    getSSI4TwoSecondStageQuestions();
  }

  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};

  Future<void> getSSI4TwoSecondStageQuestions() async {
    emit(SecondStageSsi4TwoDartLoading());
    try {
      questionList
          .assignAll(await Ssi4twoSecondQuestionService.findManyTwoSsi4());

      print(questionList);

      emit(SecondStageSsi4TwoDartSuccess(ssi4QuestionModel: questionList));
    } on DioError catch (_) {
      emit(SecondStageSsi4TwoDartError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      print("err");
      log(e.toString());
      log(es.toString());
      emit(SecondStageSsi4TwoDartError(msg: e.toString()));
    }
  }

  Future<void> postUploadVideosSSI4TwoSecondStage({
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
          'PatientExams/AddPatientSSI4ExamAnswers/$userId/$examId/$id/4',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(SecondStageSsi4TwoDartSuccess(ssi4QuestionModel: questionList));
      Alert.success('تم رفع الفيديو بنجاح');
    } on DioError catch (_) {
      emit(SecondStageSsi4TwoDartError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      Alert.error(e.toString());
      log(e.toString());
      log(st.toString());
      emit(SecondStageSsi4TwoDartError(msg: e.toString()));
    }
  }
}
