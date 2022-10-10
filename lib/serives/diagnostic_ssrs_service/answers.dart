import 'package:queen/core/helpers/prefs.dart';

import '../../config/dio_helper/dio.dart';
import '../../screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

class DiagnosticSSRSAnswers {
  static Future<Message?> postDiagnosticSSRSAnswers({
    required Map<Question, Answers> answers,
   // required Map<Question, String> answersTxt,
  }) async {
     buildPatientAnswers(Question q) {
      // final answer = answers[q];
      // if (answer == null || answer.isOther) {
      //   return [answersTxt[q]!];
      // }

      return answers[q]!.id.toString();

    }

    final userId = Prefs.getString("userId");

    final res = await NetWork.post(
      'PatientExams/AddPatientSSRSExamAnswersMobile',
      body: <Question>{
        ...answers.keys,
       // ...answersTxt.keys,
      }.toList().map((q) {
        return {
          "userId": userId,
          "patientCurrentStage": 1,
          "questionId": q.id,
          "examId": q.examId,
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
