import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../../config/dio_helper/dio.dart';
import '../models/answer_model.dart';
import '../models/diagnostic_history_question_model.dart';

part 'diagnostic_history_question_state.dart';

class DiagnosticHistoryQuestionCubit
    extends Cubit<DiagnosticHistoryQuestionState> {
  DiagnosticHistoryQuestionCubit() : super(DiagnosticHistoryQuestionInitial()) {
    getDiagnosticHistoryQuestion();
  }

  final list = <Data>[];
  final listOfCategoryTwo = <Data>[];
  final listOfCategoryThree = <Data>[];
  final answerList = <Answers>[];
  final answer = <int,Answers>{};
  bool shouldShowTextField({required int  questionId}){
    if(answer[questionId] == null){
      return false;
    }else{
      final qa = answer[questionId];
      return qa?.isOther;
    }
  }

  Future<void> getDiagnosticHistoryQuestion() async {
    list.clear();
    emit(DiagnosticHistoryQuestionLoading());

    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'CaseHistory/GetCaseHistoryByExameCode/$userId/ex_ph');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      (res.data['data'] as List)
          .map((e) => list.add(Data.fromJson(e)))
          .toList();

      log('${listOfCategoryTwo.length}');
      log('${list.length}');
      for (final i in list) {
        if (i.question?.categoryId == 2) {
          listOfCategoryTwo.add(i);
        }
        if (i.question?.categoryId == 3) {
          listOfCategoryTwo.add(i);
          }
        if (i.question?.categoryId == 4) {
          listOfCategoryTwo.add(i);
          }
        if (i.question?.categoryId == 5) {
          listOfCategoryTwo.add(i);
          }
        if (i.question?.categoryId == 6) {
          listOfCategoryTwo.add(i);
          }
        if (i.question?.categoryId == 7) {
          listOfCategoryTwo.add(i);
          }

      }
      log('${listOfCategoryTwo.length}');
      log('${list}');
      emit(DiagnosticHistoryQuestionSuccess(
          diagnosticHistoryQuestionModel: list));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(DiagnosticHistoryQuestionError(msg: e.toString()));
    }
  }



  /// TODO:: Questions Answers Post Request
  Future<void> postDiagnosticHistoryAnswers({
    required List<AnswersModel> answers
  }) async {
    emit(DiagnosticHistoryQuestionLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.post(
        'CaseHistory/AddCaseHistory/$userId/1',
        body: answers.map((e) => {
          'question':e.question?.toJson(),
          'patientAnswers':e.patientAnswers
        }).toList(),
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(DiagnosticHistoryQuestionSuccess(
          diagnosticHistoryQuestionModel: list));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(DiagnosticHistoryQuestionError(msg: e.toString()));
    }
  }
}
