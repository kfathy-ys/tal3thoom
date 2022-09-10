import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../widgets/network_dialog.dart';
import 'package:tal3thoom/serives/question_serives.dart';
import '../models/diagnostic_history_question_model.dart';

part 'diagnostic_history_question_state.dart';

class DiagnosticHistoryQuestionCubit
    extends Cubit<DiagnosticHistoryQuestionState> {
  DiagnosticHistoryQuestionCubit() : super(DiagnosticHistoryQuestionInitial()) {
    getDiagnosticHistoryQuestion();
  }

  int index = 0;
  final questionList = <Question>[];

  final answer = <Question, Answers>{};

  bool shouldShowTextField(Question question) {
    if (question.answers.isEmpty) {
      print('no answers');
      return true;
    } else if (answer[question] != null && answer[question]!.isOther){
      return true;
    }
    return false;
  }

  Future<void> getDiagnosticHistoryQuestion() async {
    emit(DiagnosticHistoryQuestionLoading());
    try {
      questionList.assignAll(await QuestionService.findMany());

      print(questionList);
         emit(DiagnosticHistoryQuestionSuccess(
          diagnosticHistoryQuestionModel: questionList));
    } on DioError catch (_) {
      emit(DiagnosticHistoryQuestionError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(DiagnosticHistoryQuestionError(msg: e.toString()));
    }
  }

  /// TODO:: Questions Answers Post Request
//
// final answers = <Question, Answers>{};
// final allAnswers = <String>[];
//
// void addAnswer({required Question questions, required Answers answer}) {
//   answers[questions] = answer;
// }
//
// Future<void> postDiagnosticHistoryAnswers() async {
//   emit(DiagnosticHistoryQuestionLoading());
//
//   try {
//     final userId = Prefs.getString("userId");
//     // String myJson =
//     //     ' [ {"userId": "e7572d27-171f-41f9-ad5d-44458db2e184","patientCurrentStage": 1,"questionId": 1019,"description": "هل كنت تدرس في مدرسة أهلية أم حكوميةْ؟","examId": 2054,"categoryId": 2,"sectionId": null,"patientAnswers": ["حكوميةْ"]}]';
//     // final String jsonString = jsonEncode(myJson);
//     //  final String x= jsonString.replaceAll('\\', '');
//     final res = await NetWork.post('CaseHistory/AddCaseHistory2',
//         body: list
//             .map((e) => {
//                   "userId": userId,
//                   "patientCurrentStage": 1,
//                   "questionId": e.question?.id,
//                   "description": e.question?.description,
//                   "examId": e.question?.examId,
//                   "categoryId": e.question?.categoryId,
//                   "sectionId": null,
//                   "patientAnswers": allAnswers
//                 })
//             .toList()
//
//         // [
//         //   {
//         //     "userId": userId,
//         //     "patientCurrentStage": 1,
//         //    "questionId": 1019,
//         //     "description": "هل كنت تدرس في مدرسة أهلية أم حكوميةْ؟",
//         //     "examId": 2054,
//         //     "categoryId": 2,
//         //     "sectionId": null,
//         //     "patientAnswers": ["حكوميةْ"]
//         //   }
//         // ],
//
//         // answers.keys.map((q) {
//         //   return
//         // {
//         //   "userId": userId,
//         //   "patientCurrentStage": 1,
//         //   "questionId": q.toJson(),
//         //   "description": "هل كنت تدرس في مدرسة أهلية أم حكوميةْ؟",
//         //   "examId": 2054,
//         //   "categoryId": 2,
//         //   "sectionId": null,
//         //   "patientAnswers": answers[q]?.toJson()
//         // };
//         // }).toList(),
//
//         );
//     if (res.data['status'] == 0 || res.data['status'] == -1) {
//       throw res.data['message'];
//     }
//
//     emit(DiagnosticHistoryQuestionSuccess(
//         diagnosticHistoryQuestionModel: list));
//   } catch (e, st) {
//     log(e.toString());
//     log(st.toString());
//     emit(DiagnosticHistoryQuestionError(msg: e.toString()));
//   }
// }
}
