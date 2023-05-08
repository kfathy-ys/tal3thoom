import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/serives/first_stage_injects/pre_questionnair/answers_service.dart';
import 'package:tal3thoom/serives/first_stage_injects/pre_questionnair/question_serives.dart';

import '../../../../../../../widgets/alerts.dart';
import '../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../../../../diagnostic_service/page/views/success_page.dart';
import '../../first_session/first_cognitive_session/view.dart';

part 'pre_questionnaire_state.dart';

class PreQuestionnaireCubit extends Cubit<PreQuestionnaireState> {
  PreQuestionnaireCubit() : super(PreQuestionnaireInitial()) {
    getPreQuestionnaire();
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

  Future<void> getPreQuestionnaire() async {
    emit(PreQuestionnaireLoading());
    try {
      questionList.assignAll(await PreQuestionnaireService.findMany());

      print(questionList);
      emit(PreQuestionnaireSuccess(preQuestionnaireModel: questionList));
    } on DioError catch (_) {
      emit(PreQuestionnaireError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(PreQuestionnaireError(msg: e.toString()));
    }
  }

  Future<void> postPreQuestionnaireAnswers() async {
    emit(PreQuestionnaireLoading());
    try {
      final res =
          await PreQuestionnaireAnswersService.postPreQuestionnaireAnswers(
              answers: answer, answersTxt: answersTxt);
      emit(PreQuestionnaireSuccess(preQuestionnaireModel: questionList));

      if (res!.type == 2 || (res.type == 3)) {
        Alert.error(res.body);
      } else if (res.type == 1) {
        Alert.success(res.body);
        Get.offAll(() => SuccessView(
              title1: "لقد تم إنتهاء إستبيان ما قبل العلاج بنجاح",
              title2: "إنتقال إلي الرحلة الأولي من العلاج ",
              onTap: () => Get.offAll(() => const FirstTreatmentSession()),
            ));
      } else if (res.type == 3) {
        Alert.success(res.body);
      } else {
        return Alert.success("ssssssssss");
      }
    } on DioError catch (_) {
      emit(PreQuestionnaireError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e) {
      Alert.error(e.toString(),
          desc:
          "الرجاء المحاولة مرة أخري وتاكيد اجابات الممكنة المطلوبة وفقا لمعاير التشخيص");
      log("[]][][][error from cubit is" + e.toString());



      emit(PreQuestionnaireError(msg: e.toString()));
    }
  }
}
