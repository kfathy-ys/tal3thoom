import 'package:queen/core/helpers/prefs.dart';

import '../../../config/dio_helper/dio.dart';
import '../../../screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

class DiagnosticSSRSAnswers {
  static getApiBody({required Map<Question, Answers> answers}) {
    final userId = Prefs.getString("userId");
    return {
      "userId": userId,
      "patientCurrentStage": 1,
      "questionId": answers.keys.first.id,
      "examId": answers.keys.first.examId,
      "sectionId": answers.keys.first.sectionId,
      "answerId": answers.values.first.id,
    };
  }

  static Future<Message?> postDiagnosticSSRSAnswers({
    required Map<Question, Answers> answers,
  }) async {
    final res = await NetWork.post(
        'PatientExams/AddPatientSSRSExamAnswersMobile',
        body: getApiBody(answers: answers));

    if (res.data['status'] == 1 || res.data['status'] == 200) {
      final _msg = Message.fromMap(res.data['messages'][0]);
      return _msg;
    }
    return null;
  }
}
