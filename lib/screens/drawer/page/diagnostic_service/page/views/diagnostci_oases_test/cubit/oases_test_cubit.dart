import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_ssi4/views/department_one/view.dart';

import '../../../../../../../../serives/diagnostic_oases_service/answers_service.dart';
import '../../../../../../../../serives/diagnostic_oases_service/question_serives.dart';
import '../../../../../../../widgets/alerts.dart';
import '../../diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../question.dart';
import '../../success_page.dart';

part 'oases_test_state.dart';

class OasesTestCubit extends Cubit<OasesTestState> {
  OasesTestCubit() : super(OasesTestInitial()){
    getOasesQuestion();
  }

  int index = 0;
  int totalCounter = 1;
  bool isFinishedAnswered = false;
  int selectedGroupIndex = 0;
  bool isFirstGroupFinished = false;
  List<CheckBoxItem> selectedQuestions = sixQuestionsList;

  void nextQuestionsOne() {
    index = 0;
    selectedGroupIndex++;
    isFinishedAnswered = false;
    emit(OasesTestSuccess(oasesQuestionModel: questionList));
  }


  final TextEditingController controllerDefault = TextEditingController();

  final formKey = GlobalKey<FormState>();

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

  Future<void> getOasesQuestion() async {
    emit(OasesTestLoading());
    try {
      questionList.assignAll(await OasesQuestionService.findManyDiagnosticOases());

      print(questionList);
      emit(OasesTestSuccess(oasesQuestionModel:  questionList));
    } on DioError catch (_) {
      emit(OasesTestError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(OasesTestError(msg: e.toString()));
    }
  }



  Future<void> postOasesAnswers() async {
    emit(OasesTestLoading());

    try {
      final res = await DiagnosticOasesAnswers.postDiagnosticOasesAnswers(
          answers: answer, answersTxt: answersTxt);

      emit(OasesTestSuccess(oasesQuestionModel: questionList));
      if (res!.type == 2) {
        Alert.error(res.body);
      } else if (res.type == 1) {
        Alert.success(res.body);
        Get.off(() => SuccessView(
          title1: "لقد تم إنتهاء إختبار التاريخ المرضي بنجاح",
          title2: "إنتقال إلي إختبار Oases",
          onTap: () => Get.off(() =>  DiagnosticSSI4()),
        ));
      } else if (res.type == 3) {
        Alert.success(res.body);
      } else {
        return Alert.success("0");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(OasesTestError(msg: e.toString()));
    }
  }

}
