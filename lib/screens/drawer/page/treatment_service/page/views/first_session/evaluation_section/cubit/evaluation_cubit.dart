import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:tal3thoom/serives/first_stage_injects/sessions/evaluation_section/answers_service.dart';
import 'package:tal3thoom/serives/first_stage_injects/sessions/evaluation_section/question_serives.dart';

import '../../../../../../../../widgets/alerts.dart';
import '../../../../../../../../widgets/fast_widget.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../../../../../diagnostic_service/page/views/success_page.dart';
import '../../first_stage_additional_traning/view.dart';

part 'evaluation_state.dart';

class EvaluationCubit extends Cubit<EvaluationState> {
  EvaluationCubit() : super(EvaluationInitial()){
    getEvaluationSection();
  }


  final TextEditingController controllerDefault = TextEditingController();

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

  Future<void> getEvaluationSection() async {
    emit(EvaluationLoading());
    try {
      questionList.assignAll(await EvaluationSectionService.findMany());

      print(questionList);
      emit(EvaluationSuccess(questionEvaluation:  questionList));
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
        answers: answer,);
      emit(EvaluationSuccess(questionEvaluation:   questionList));

      if (res!.type == 2) {
        Alert.error(res.body);
      } else if (res.type == 1) {
        Alert.success(res.body);
        Get.off(() =>  SuccessView(
          goNext: true,
          title3: "الانتقال إالي المرحلة التالية",
          onTap2: () => Get.off(()=>const FirstStageAdditionalTrainingScreen()),
          title1:
          "لقد اتممت الجلسة العلاجية وسيتم تحويلك إلي الجلسة التالية عن طريق المختص بعد تقييمة لنتائج الجلسة والفيديو التي قمت بارسالة",
          title2: "تدريب وتعليم إضافي",
          onTap: () => Get.off(()=>const FirstStageAdditionalTrainingScreen()),
        ));
      } else if (res.type == 3) {
        Alert.success(res.body);
      } else {
        return Alert.success("ssssssssss");
      }
    } catch (e, st) {
      log("[]][][][error from cubit is" + e.toString());
      log(st.toString());

      emit(EvaluationError(msg: e.toString()));
    }
  }
}
