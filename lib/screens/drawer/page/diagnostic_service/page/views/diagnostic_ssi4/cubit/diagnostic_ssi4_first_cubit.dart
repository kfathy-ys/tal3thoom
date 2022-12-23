import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/serives/diagnostics_injects/diagnostic_ssi4/question.dart';

import '../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../widgets/alerts.dart';
import '../../diagnostic_history/models/diagnostic_history_question_model.dart';

part 'diagnostic_ssi4_first_state.dart';

class DiagnosticSsi4FirstCubit extends Cubit<DiagnosticSsi4FirstState> {
  DiagnosticSsi4FirstCubit() : super(DiagnosticSsi4FirstInitial()) {
    getSSI4FirstQuestions();
  }

  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};

  Future<void> getSSI4FirstQuestions() async {
    emit(DiagnosticSsi4FirstLoading());
    try {
      questionList
          .assignAll(await Ssi4QuestionService.findManyDiagnosticSsi4());

      print(questionList);

      emit(DiagnosticSsi4FirstSuccess(ssi4QuestionModel: questionList));
    } on DioError catch (_) {
      emit(DiagnosticSsi4FirstError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      print("err");
      log(e.toString());
      log(es.toString());
      emit(DiagnosticSsi4FirstError(msg: e.toString()));
    }
  }

  Future<void> postUploadVideoSSI4({
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
          'PatientExams/AddPatientSSI4ExamAnswers/$userId/$examId/$id/1',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['messages'][0]['title'].toString();
      }
      emit(DiagnosticSsi4FirstSuccess(ssi4QuestionModel: questionList));
      Alert.success('تم رفع الفيديو بنجاح');
    } on DioError catch (_) {
      emit(DiagnosticSsi4FirstError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      Alert.error(e.toString());
      log(e.toString());
      log(st.toString());
      emit(DiagnosticSsi4FirstError(msg: e.toString()));
    }
  }
}
