import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import '../../../config/dio_helper/dio.dart';

class FirstOasesAnswers {
  static Future<Message?> postFirstOasesAnswers({
    required Map<Question, Answers> answers,
  }) async {
    final list = [];

    final userId = Prefs.getString("userId");

    answers.forEach((k, v) {
      list.add({
        "userId": userId,
        "patientCurrentStage": 2,
        "questionId": k.id,
        "description": k.description,
        "examId": k.examId,
        "categoryId": k.categoryId,
        "sectionId": k.sectionId,
        "answerId": v.id
      });
    });
    final res = await NetWork.post(
        'PatientExams/AddPatientOasesExamAllQuestionsAnswers',
        body: list);

    if (res.data['status'] == 1 || res.data['status'] == 200) {
      final _msg = Message.fromMap(res.data['messages'][0]);
      return _msg;
    }
    return null;
  }
}
