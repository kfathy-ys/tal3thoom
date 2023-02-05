import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import '../../../config/dio_helper/dio.dart';

class AnswersService {
  static Future<Message?> postAnswers({
    required Map<Question, Answers> answers,
    required Map<Question, String> answersTxt,
  }) async {
    List<String> buildPatientAnswers(Question q) {
      final answer = answers[q];
      if (answer == null || answer.isOther) {
        return [answersTxt[q]!];
      }
      return [answers[q]!.answerOption.toString()];
    }

    final userId = Prefs.getString("userId");
    final Message? _m;
    final res = await NetWork.post(
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
    if (res.data['status'] == 1 || res.data['status'] == 200) {
      final _msg = Message.fromMap(res.data['messages'][0]);
      print("$_msgكده المسيدج جت");
      return _msg;
    }

    /*
    *   // print(res.statusCode.toString() + "khallllllllled");
    // print(res.data.toString() + "khallllllllled");
    //  if (res.data['status'] == -1) {
    //   print(res.data['messages'][0]['body']);
    //   throw  res.data['messages'][0]['body'].toString();
    * */
    throw  res.data['messages'][0]['body'].toString();
   // return Future.value(Message.fromMap(res.data['messages'][0]['body']+"ززززززززززفت"));
  }
}
