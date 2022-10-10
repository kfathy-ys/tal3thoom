import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core.dart';
import 'package:tal3thoom/serives/diagnostic_ssrs_service/question.dart';

import '../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../serives/diagnostic_ssrs_service/answers.dart';
import '../../../../../../../../serives/diagnostic_ssrs_service/question.dart';
import '../../../../../../../widgets/alerts.dart';
import '../../diagnostic_history/models/diagnostic_history_question_model.dart';
import '../../success_page.dart';

part 'diagnostic_ssrs_state.dart';

class DiagnosticSsrsCubit extends Cubit<DiagnosticSsrsState> {
  DiagnosticSsrsCubit() : super(DiagnosticSsrsInitial()){
    getSSRSQuestions();
  }


  var userId = Prefs.getString("userId");
 final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};
  Future<void> getSSRSQuestions() async {


    emit(DiagnosticSsrsLoading());
    try {
      questionList.assignAll(await SsrsQuestionService.findManyDiagnosticSsrs());

      print(questionList);



      emit(DiagnosticSsrsSuccess(ssrsQuestionModel: questionList));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(DiagnosticSsrsError(msg: e.toString()));
    }
  }
  Future<void> postSSRSAnswers() async {
    emit(DiagnosticSsrsLoading());

    try {
       await DiagnosticSSRSAnswers.postDiagnosticSSRSAnswers(
          answers: answer,);

      emit(DiagnosticSsrsSuccess( ssrsQuestionModel: questionList));
      print(questionList);



    } catch (e, st) {
     // print(answer);
      log(e.toString());
      log(st.toString());
      emit(DiagnosticSsrsError(msg: e.toString()));
    }
  }

}
