import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/serives/second_stage_inject/sessions/cognitive_section/answers_service.dart';
import 'package:tal3thoom/serives/second_stage_inject/sessions/cognitive_section/question_serives.dart';

import '../../../../../../../../widgets/alerts.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../second_tratement_sessions_sloki/view.dart';

part 'second_cognitive_section_state.dart';

class SecondCognitiveSectionCubit extends Cubit<SecondCognitiveSectionState> {
  SecondCognitiveSectionCubit() : super(SecondCognitiveSectionInitial()) {
    getSecondCognitiveSection();
  }

  final TextEditingController controllerDefault = TextEditingController();

  final formKey = GlobalKey<FormState>();
  int index = 0;
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};
  final currentDiagnosesStatus = Prefs.getString("currentDiagnosesStatus");

  bool shouldShowTextField(Question question) {
    if (question.answers.isEmpty) {
      print('no answers');
      return true;
    } else if (answer[question] != null && answer[question]!.isOther) {
      return true;
    }
    return false;
  }

  Future<void> getSecondCognitiveSection() async {
    emit(SecondCognitiveSectionLoading());
    try {
      questionList.assignAll(await SecondCognitiveSectionService.findMany());
      print(questionList);
      emit(SecondCognitiveSectionSuccess(questionModel: questionList));
    } on DioError catch (_) {
      emit(SecondCognitiveSectionError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(SecondCognitiveSectionError(msg: e.toString()));
    }
  }

  Future<void> sendSecondCognitiveSectionAnswers() async {
    emit(SecondCognitiveSectionLoading());
    try {
      final res = await SecondCognitiveSectionAnswersService
          .postSecondCognitiveSectionAnswers(
        answers: answer,
      );
      answer.clear();
      emit(SecondCognitiveSectionSuccess(questionModel: questionList));
      if (res!.type == 2) {
        Alert.error(res.body);
      } else if (res.type == 1) {
        Alert.success(res.body);
        Get.off(() => const SecondTreatmentSessionsSlokiScreen());
      } else if (res.type == 3) {
        Alert.success(res.body);
      } else {
        return Alert.success("ssssssssss");
      }
    } on DioError catch (_) {
      emit(SecondCognitiveSectionError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log("[]][][][error from cubit is" + e.toString());
      log(st.toString());

      emit(SecondCognitiveSectionError(msg: e.toString()));
    }
  }
}
