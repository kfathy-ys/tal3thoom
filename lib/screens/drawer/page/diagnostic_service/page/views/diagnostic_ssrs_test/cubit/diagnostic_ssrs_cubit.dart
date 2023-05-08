import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core.dart';
import 'package:tal3thoom/serives/diagnostics_injects/diagnostic_ssrs_service/answers.dart';
import 'package:tal3thoom/serives/diagnostics_injects/diagnostic_ssrs_service/question.dart';

import '../../diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../diagnostic_ssi4/views/department_one/view.dart';
import '../../success_page.dart';

part 'diagnostic_ssrs_state.dart';

class DiagnosticSsrsCubit extends Cubit<DiagnosticSsrsState> {
  DiagnosticSsrsCubit() : super(DiagnosticSsrsInitial()) {
    getSSRSQuestions();
  }

  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  var answer = <Question, Answers>{};

  Future<void> getSSRSQuestions() async {
    emit(DiagnosticSsrsLoading());
    try {
      questionList
          .assignAll(await SsrsQuestionService.findManyDiagnosticSsrs());

      print(questionList);

      emit(DiagnosticSsrsSuccess(ssrsQuestionModel: questionList));
    } on DioError catch (_) {
      emit(DiagnosticSsrsError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(DiagnosticSsrsError(msg: e.toString()));
    }
  }

  Future<void> postSSRSAnswers() async {
    emit(DiagnosticSsrsLoading());

    try {
      await DiagnosticSSRSAnswers.postDiagnosticSSRSAnswers(
        answers: answer,
      );

      emit(DiagnosticSsrsSuccess(ssrsQuestionModel: questionList));
      Get.offAll(() {
        return SuccessView(
            title1: "لقد تم إنتهاء إختبار SSRS بنجاح",
            title2: "إنتقال إلي إختبار SSI-4",
            onTap: () => Get.offAll(() => const DiagnosticSSI4()));
      });
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(DiagnosticSsrsError(msg: e.toString()));
    }
  }
}
