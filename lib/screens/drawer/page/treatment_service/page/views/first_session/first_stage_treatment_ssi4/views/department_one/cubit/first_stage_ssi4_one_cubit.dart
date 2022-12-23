import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/serives/first_stage_injects/first_stage_ssi4/question.dart';

import '../../../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../../../widgets/alerts.dart';
import '../../../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

part 'first_stage_ssi4_one_state.dart';

class FirstStageSsi4OneCubit extends Cubit<FirstStageSsi4OneState> {
  FirstStageSsi4OneCubit() : super(FirstStageSsi4OneInitial()) {
    getSSI4FirstStageQuestions();
  }

  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};

  Future<void> getSSI4FirstStageQuestions() async {
    emit(FirstStageSsi4OneLoading());
    try {
      questionList
          .assignAll(await Ssi4FirstQuestionService.findManyFirstSsi4());

      print(questionList);

      emit(FirstStageSsi4OneSuccess(ssi4QuestionModel: questionList));
    } on DioError catch (_) {
      emit(FirstStageSsi4OneError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      print("err");
      log(e.toString());
      log(es.toString());
      emit(FirstStageSsi4OneError(msg: e.toString()));
    }
  }

  Future<void> postUploadVideoSSI4FirstStage({
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
      emit(FirstStageSsi4OneSuccess(ssi4QuestionModel: questionList));
      Alert.success('تم رفع الفيديو بنجاح');
    } on DioError catch (_) {
      emit(FirstStageSsi4OneError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(FirstStageSsi4OneError(msg: e.toString()));
    }
  }
}
