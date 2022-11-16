// import 'package:queen/core/helpers/prefs.dart';
//
// import '../../../config/dio_helper/dio.dart';
//
// class QuestionService {
//   static Future<List<Question>> findMany() async {
//     final userId = Prefs.getString("userId");
//
//     final res = await NetWork.get(
//         'PatientExamResult/GetPatientExamResultByExameCodeMobile/$userId/ex_ph');
//         return List.from(res.data["data"])
//         .map((e) => Question.fromJson(e))
//         .toList();
//   }
// }
