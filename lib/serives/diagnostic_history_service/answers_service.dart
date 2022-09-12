import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import '../../config/dio_helper/dio.dart';

class AnswersService {
  static Future<void> postAnswers({
    required Map<Question, Answers> answers,
    required Map<Question, String> answersTxt,
  }) async {
    List<String> buildPatientAnswers(Question q) {
      final answer = answers[q];
      if (answer == null|| answer.isOther) {
        return [answersTxt[q]!];
      }
      return [answers[q]!.answerOption.toString()];
    }

    final userId = Prefs.getString("userId");

    await NetWork.post(
      'CaseHistory/AddCaseHistory2',
      body: <Question>{
        ...answers.keys,
        ...answersTxt.keys,
      }.toList().map((q) {
        return {
          "userId": userId,
          "patientCurrentStage": 1,
          "questionId": q.id,
          "description": q.description,
          "examId": q.examId,
          "categoryId": q.categoryId,
          "sectionId": q.sectionId,
          "patientAnswers": buildPatientAnswers(q)
        };
      }).toList(),
    );
  }
}
