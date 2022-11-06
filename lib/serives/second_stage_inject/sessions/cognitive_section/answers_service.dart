import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import '../../../../config/dio_helper/dio.dart';

class SecondCognitiveSectionAnswersService {
  static Future<Message?> postSecondCognitiveSectionAnswers({
    required Map<Question, Answers> answers,
  }) async {
    buildPatientAnswers(Question q) {
      return answers[q]!.id.toString();
    }

    final userId = Prefs.getString("userId");

    final res = await NetWork.post(
      'PatientExams/AddPatienTreatmentSessionCognitiveExamAnswersMobile',
      body: <Question>{
        ...answers.keys,
      }.toList().map((q) {
        return {
          "userId": userId,
          "patientCurrentStage": 4,
          "questionId": q.id,
          "sectionId": q.sectionId,
          "examId": q.examId,
          "answerId": buildPatientAnswers(q)
        };
      }).toList(),
    );
    if (res.data['status'] == 1 || res.data['status'] == 200) {
      final _msg = Message.fromMap(res.data['messages'][0]);
      return _msg;
    }
    return null;
  }
}
