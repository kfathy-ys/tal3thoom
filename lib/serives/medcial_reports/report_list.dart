import 'package:queen/core/helpers/prefs.dart';

import '../../config/dio_helper/dio.dart';
import '../../screens/drawer/page/medical_reports/models/medcial_report_model.dart';

class AllReportsService {
  static Future<List<AllReports>> findMany() async {
    final userId = Prefs.getString("userId");

    final res = await NetWork.get('Report/GetPatientApprovedReports/$userId');
    return List.from(res.data["data"])
        .map((e) => AllReports.fromJson(e))
        .toList();
  }
}
