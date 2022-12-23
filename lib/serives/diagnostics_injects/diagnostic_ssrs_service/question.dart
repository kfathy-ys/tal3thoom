import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import '../../../config/dio_helper/dio.dart';

class SsrsQuestionService {
  static Future<List<Question>> findManyDiagnosticSsrs() async {
    final userId = Prefs.getString("userId");

    final res = await NetWork.get(
        'PatientExams/GetExamQuestionsAnswersByExameCode/$userId/EX_SSRS/1');

    return List.from(res.data["data"])
        .map((e) => Question.fromJson(e))
        .toList();
  }
}

class SsrsQuestionSVideo {
  static Future<List<Question>> uploadVideoSsrs() async {
    final userId = Prefs.getString("userId");

    final res = await NetWork.get(
        'PatientExams/GetExamQuestionsAnswersByExameCode/$userId/EX_SSRS/1');

    return List.from(res.data["data"])
        .map((e) => Question.fromJson(e))
        .toList();
  }
}
