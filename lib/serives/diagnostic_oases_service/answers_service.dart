import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import '../../config/dio_helper/dio.dart';

class DiagnosticOasesAnswers {
  static Future<Message?> postDiagnosticOasesAnswers({
    required Map<Question, Answers> answers,
    required Map<Question, String> answersTxt,
  }) async {
     buildPatientAnswers(Question q) {
      final answer = answers[q];
      if (answer == null || answer.isOther) {
        return [answersTxt[q]!];
      }
      return answers[q]!.id.toString();
    }

    final userId = Prefs.getString("userId");

    final res = await NetWork.post(
      'PatientExams/AddPatientOasesExamAllQuestionsAnswers',
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
          "answerId": buildPatientAnswers(q)
        };
      }).toList(),
    );
    if (res.data['status'] == 1 || res.data['status'] == 200) {
      final _msg = Message.fromMap(res.data['messages'][0]);
      return _msg;
    }
  }
}
