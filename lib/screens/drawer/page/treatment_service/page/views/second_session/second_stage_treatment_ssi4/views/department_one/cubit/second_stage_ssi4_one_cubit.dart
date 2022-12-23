import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:dio/dio.dart' as _dio;
import '../../../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../../../../serives/second_stage_inject/second__stage_ssi4_one/question.dart';
import '../../../../../../../../../../widgets/alerts.dart';
import '../../../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

part 'second_stage_ssi4_one_state.dart';

class SecondStageSsi4OneCubit extends Cubit<SecondStageSsi4OneState> {
  SecondStageSsi4OneCubit() : super(SecondStageSsi4OneInitial()) {
    getSSI4SecondStageQuestions();
  }
  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};

  Future<void> getSSI4SecondStageQuestions() async {
    emit(SecondStageSsi4OneLoading());
    try {
      questionList
          .assignAll(await Ssi4OneSecondQuestionService.findManyFirstSsi4());

      print(questionList);

      emit(SecondStageSsi4OneSuccess(ssi4QuestionModel: questionList));
    } on DioError catch (_) {
      emit(SecondStageSsi4OneError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      print("err");
      log(e.toString());
      log(es.toString());
      emit(SecondStageSsi4OneError(msg: e.toString()));
    }
  }

  Future<void> postUploadVideoSSI4SecondFirstStage({
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
      emit(SecondStageSsi4OneSuccess(ssi4QuestionModel: questionList));
      Alert.success('تم رفع الفيديو بنجاح');
    } on DioError catch (_) {
      emit(SecondStageSsi4OneError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(SecondStageSsi4OneError(msg: e.toString()));
    }
  }
}
