import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../../../serives/second_stage_inject/ssrs/answers.dart';
import '../../../../../../../../../serives/second_stage_inject/ssrs/question.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../../../../../diagnostic_service/page/views/success_page.dart';
import '../../second_stage_treatment_ssi4/views/department_one/view.dart';

part 'second_stage_ssrs_state.dart';

class SecondStageSsrsCubit extends Cubit<SecondStageSsrsState> {
  SecondStageSsrsCubit() : super(SecondStageSsrsInitial()) {
    getSecondStageSsrsSSRSQuestions();
  }

  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  var answer = <Question, Answers>{};

  Future<void> getSecondStageSsrsSSRSQuestions() async {
    emit(SecondStageSsrsLoading());
    try {
      questionList.assignAll(
          await SecondStageSsrsQuestionService.findManySecondStageSsrs());

      print(questionList);

      emit(SecondStageSsrsSuccess(ssrsQuestionModel: questionList));
    } on DioError catch (_) {
      emit(SecondStageSsrsError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(SecondStageSsrsError(msg: e.toString()));
    }
  }

  Future<void> postSecondStageSsrsSSRSAnswers() async {
    emit(SecondStageSsrsLoading());

    try {
      await SecondStageSSRSAnswers.postSecondStageSSRSAnswers(
        answers: answer,
      );

      emit(SecondStageSsrsSuccess(ssrsQuestionModel: questionList));
      Get.off(() {
        return SuccessView(
            title1: "لقد تم إنتهاء إختبار SSRS بنجاح",
            title2: "إنتقال إلي إختبار SSI-4",
            onTap: () => Get.off(() => const SecondTreatmentSSI4()));
      });
    } on DioError catch (_) {
      emit(SecondStageSsrsError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(SecondStageSsrsError(msg: e.toString()));
    }
  }
}
