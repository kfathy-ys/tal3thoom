import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../../../serives/first_stage_injects/ssrs/answers.dart';
import '../../../../../../../../../serives/first_stage_injects/ssrs/question.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../../../../../diagnostic_service/page/views/success_page.dart';
import '../../first_stage_treatment_ssi4/views/department_one/view.dart';

part 'first_stage_ssrs_state.dart';

class FirstStageSsrsCubit extends Cubit<FirstStageSsrsState> {
  FirstStageSsrsCubit() : super(FirstStageSsrsInitial()) {
    getFirstSSRSQuestions();
  }

  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  var answer = <Question, Answers>{};

  Future<void> getFirstSSRSQuestions() async {
    emit(FirstStageSsrsLoading());
    try {
      questionList.assignAll(
          await FirstStageSsrsQuestionService.findManyFirstStageSsrs());

      print(questionList);

      emit(FirstStageSsrsSuccess(ssrsQuestionModel: questionList));
    } on DioError catch (_) {
      emit(FirstStageSsrsError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(FirstStageSsrsError(msg: e.toString()));
    }
  }

  Future<void> postFirstSSRSAnswers() async {
    emit(FirstStageSsrsLoading());

    try {
      await FirstStageSSRSAnswers.postFirstStageSSRSAnswers(
        answers: answer,
      );

      emit(FirstStageSsrsSuccess(ssrsQuestionModel: questionList));
      Get.off(() {
        return SuccessView(
            title1: "لقد تم إنتهاء إختبار SSRS بنجاح",
            title2: "إنتقال إلي إختبار SSI-4",
            onTap: () => Get.off(() => const TreatmentSSI4()));
      });
    } on DioError catch (_) {
      emit(FirstStageSsrsError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(FirstStageSsrsError(msg: e.toString()));
    }
  }
}
