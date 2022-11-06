import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import '../../../config/dio_helper/dio.dart';

class FirstOasesQuestionService {
  static Future<List<Question>> findManyFirstOases() async {
    final userId = Prefs.getString("userId");

    final res = await NetWork.get(
        'PatientExams/GetExamQuestionsAnswersByExameCode/$userId/EX_OASES/2');

    return List.from(res.data["data"])
        .map((e) => Question.fromJson(e))
        .toList();
  }
}
