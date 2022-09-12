import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import 'package:tal3thoom/serives/diagnostic_history_service/question_serives.dart';
import '../../../../../../../../serives/diagnostic_history_service/answers_service.dart';
import '../../../../../../../widgets/alerts.dart';
import '../models/diagnostic_history_question_model.dart';

part 'diagnostic_history_question_state.dart';

class DiagnosticHistoryQuestionCubit
    extends Cubit<DiagnosticHistoryQuestionState> {
  DiagnosticHistoryQuestionCubit() : super(DiagnosticHistoryQuestionInitial()) {
    getDiagnosticHistoryQuestion();
  }

   final formKey = GlobalKey<FormState>();
  int index = 0;
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};

  bool shouldShowTextField(Question question) {
    if (question.answers.isEmpty) {
      print('no answers');
      return true;
    } else if (answer[question] != null && answer[question]!.isOther) {
      return true;
    }
    return false;
  }

  Future<void> getDiagnosticHistoryQuestion() async {
    emit(DiagnosticHistoryQuestionLoading());
    try {
      questionList.assignAll(await QuestionService.findMany());

      print(questionList);
      emit(DiagnosticHistoryQuestionSuccess(
          diagnosticHistoryQuestionModel: questionList));
    } on DioError catch (_) {
      emit(DiagnosticHistoryQuestionError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(DiagnosticHistoryQuestionError(msg: e.toString()));
    }
  }

  Future<void> postDiagnosticHistoryAnswers() async {
    emit(DiagnosticHistoryQuestionLoading());

    try {
      await AnswersService.postAnswers(answers: answer,answersTxt:answersTxt);

      emit(DiagnosticHistoryQuestionSuccess(
          diagnosticHistoryQuestionModel: questionList));
      //Alert.success("")
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(DiagnosticHistoryQuestionError(msg: e.toString()));
    }
  }
}
