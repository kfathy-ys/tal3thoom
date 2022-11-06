import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import '../../../config/dio_helper/dio.dart';

class SecondOasesQuestionService {
  static Future<List<Question>> findManySecondOases() async {
    final userId = Prefs.getString("userId");

    final res = await NetWork.get(
        'PatientExams/GetExamQuestionsAnswersByExameCode/$userId/EX_OASES/4');

    return List.from(res.data["data"])
        .map((e) => Question.fromJson(e))
        .toList();
  }
}
