// import 'package:queen/core/helpers/prefs.dart';
// import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
//
// import '../../config/dio_helper/dio.dart';
// import '../../screens/drawer/page/medical_reports/models/medcial_report_model.dart';
//
// class AllReportsDetailsService {
//   static Future<List<AllReports>> findMany({required int reportId}) async {
//     final userId = Prefs.getString("userId");
//
//     final res = await NetWork.get(
//         'Report/GetDiagnosisReportByReportId/$reportId');
//     print(res.data!.toString() +"eeeeeeeeeeeeeeeeeeeeeeee");
//
//     final x= MedialReportsModel.fromJson(res.data["data"]);
//   print(x.data!.toString() +"rrrrrrrrrrrrrrrrr");
//     return x.data!;
//   }
// }
