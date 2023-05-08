import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/serives/first_stage_injects/sessions/evaluation_section/answers_service.dart';
import 'package:tal3thoom/serives/first_stage_injects/sessions/evaluation_section/question_serives.dart';

import '../../../../../../../../widgets/alerts.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../next_sessions/view.dart';

part 'evaluation_state.dart';

class EvaluationCubit extends Cubit<EvaluationState> {
  EvaluationCubit() : super(EvaluationInitial()) {
    getEvaluationSection();
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

  Future<void> getEvaluationSection() async {
    emit(EvaluationLoading());
    try {
      questionList.assignAll(await EvaluationSectionService.findMany());

      print(questionList);
      emit(EvaluationSuccess(questionEvaluation: questionList));
    } on DioError catch (_) {
      emit(EvaluationError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(EvaluationError(msg: e.toString()));
    }
  }

  Future<void> sendEvaluationSectionAnswers() async {
    emit(EvaluationLoading());
    try {
      final res =
          await EvaluationSectionAnswersService.postCEvaluationSectionAnswers(
        answers: answer,
      );
      answer.clear();

      emit(EvaluationSuccess(questionEvaluation: questionList));
      log(currentDiagnoses);
      log(currentDiagnosesStatus);

      if (res!.type == 2) {
        Alert.error(res.body);
      } else if (res.type == 1) {
        Alert.success(res.body);
        Get.offAll(() => const NextSession());
      } else if (res.type == 3) {
        Alert.success(res.body);
      } else {
        return Alert.success("ssssssssss");
      }
    } on DioError catch (_) {
      emit(EvaluationError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log("[]][][][error from cubit is" + e.toString());
      log(st.toString());

      emit(EvaluationError(msg: e.toString()));
    }
  }
}
