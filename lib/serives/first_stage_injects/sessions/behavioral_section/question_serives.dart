import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import '../../../../config/dio_helper/dio.dart';

class BehavioralSectionService {
  static Future<List<Question>> findMany() async {
    final userId = Prefs.getString("userId");

    final res = await NetWork.get(
        'PatientExams/GetExamQuestionsAnswersByExamCodeAndSectionName/$userId/bh');
    return List.from(res.data["data"])
        .map((e) => Question.fromJson(e))
        .toList();
  }
}
