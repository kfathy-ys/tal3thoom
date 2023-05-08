import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../../../serives/first_stage_injects/sessions/cognitive_section/answers_service.dart';
import '../../../../../../../../../serives/first_stage_injects/sessions/cognitive_section/question_serives.dart';
import '../../../../../../../../widgets/alerts.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../sloki/view.dart';

part 'cognitive_section_state.dart';

class CognitiveSectionCubit extends Cubit<CognitiveSectionState> {
  CognitiveSectionCubit() : super(CognitiveSectionInitial()) {
    getCognitiveSection();
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

  Future<void> getCognitiveSection() async {
    emit(CognitiveSectionLoading());
    try {
      questionList.assignAll(await CognitiveSectionService.findMany());
      print(questionList);
      emit(CognitiveSectionSuccess(questionModel: questionList));
    } on DioError catch (_) {
      emit(CognitiveSectionError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(CognitiveSectionError(msg: e.toString()));
    }
  }

  Future<void> sendCognitiveSectionAnswers() async {
    emit(CognitiveSectionLoading());
    try {
      final res =
          await CognitiveSectionAnswersService.postCognitiveSectionAnswers(
        answers: answer,
      );
      answer.clear();
      emit(CognitiveSectionSuccess(questionModel: questionList));
      if (res!.type == 2) {
        Alert.error(res.body);
      } else if (res.type == 1) {
        Alert.success(res.body);
        Get.offAll(() => const SlokiScreen());
      } else if (res.type == 3) {
        Alert.success(res.body);
      } else {
        return Alert.success("ssssssssss");
      }
    } on DioError catch (_) {
      emit(CognitiveSectionError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log("[]][][][error from cubit is" + e.toString());
      log(st.toString());

      emit(CognitiveSectionError(msg: e.toString()));
    }
  }
}
