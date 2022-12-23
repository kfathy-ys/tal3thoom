import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/serives/second_stage_inject/sessions/evaluation_section/answers_service.dart';
import 'package:tal3thoom/serives/second_stage_inject/sessions/evaluation_section/question_serives.dart';

import '../../../../../../../../widgets/alerts.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../next_sessions_two/view.dart';

part 'second_evaluation_state.dart';

class SecondEvaluationCubit extends Cubit<SecondEvaluationState> {
  SecondEvaluationCubit() : super(SecondEvaluationInitial()) {
    getSecondEvaluationSection();
  }

  final TextEditingController controllerDefault = TextEditingController();

  final formKey = GlobalKey<FormState>();
  int index = 0;
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};
  final currentDiagnoses = Prefs.getString("currentDiagnoses");
  final currentDiagnosesStatus = Prefs.getString("currentDiagnosesStatus");
  final nextSession = Prefs.getString("nextSession");

  bool shouldShowTextField(Question question) {
    if (question.answers.isEmpty) {
      print('no answers');
      return true;
    } else if (answer[question] != null && answer[question]!.isOther) {
      return true;
    }
    return false;
  }

  Future<void> getSecondEvaluationSection() async {
    emit(SecondEvaluationLoading());
    try {
      questionList.assignAll(await SecondEvaluationSectionService.findMany());

      print(questionList);
      emit(SecondEvaluationSuccess(questionEvaluation: questionList));
    } on DioError catch (_) {
      emit(SecondEvaluationError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(SecondEvaluationError(msg: e.toString()));
    }
  }

  Future<void> sendSecondEvaluationSectionAnswers() async {
    emit(SecondEvaluationLoading());
    try {
      final res = await SecondEvaluationSectionAnswersService
          .postSecondCEvaluationSectionAnswers(
        answers: answer,
      );
      answer.clear();

      emit(SecondEvaluationSuccess(questionEvaluation: questionList));
      log(currentDiagnoses);
      log(currentDiagnosesStatus);

      if (res!.type == 2) {
        Alert.error(res.body);
      } else if (res.type == 1) {
        Alert.success(res.body);
        Get.off(() => const NextTwoSession());
      } else if (res.type == 3) {
        Alert.success(res.body);
      } else {
        return Alert.success("ssssssssss");
      }
    } on DioError catch (_) {
      emit(SecondEvaluationError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log("[]][][][error from cubit is" + e.toString());
      log(st.toString());

      emit(SecondEvaluationError(msg: e.toString()));
    }
  }
}
