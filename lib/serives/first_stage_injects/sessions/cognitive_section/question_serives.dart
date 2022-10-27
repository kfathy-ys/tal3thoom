import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import '../../../../config/dio_helper/dio.dart';


class CognitiveSectionService {
  static Future<List<Question>> findMany() async {
    final userId = Prefs.getString("userId");
    final currentStage = Prefs.getString("currentStage");
    final currentDiagnoses = Prefs.getString("currentDiagnoses");
    final nextSession = Prefs.getString("nextSession");

    final String sessionCode;
     String sessionName ="EX_TRE_S1" ;


    // if(currentDiagnoses== 12){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S1";
    // }
    // else if (currentDiagnoses== 13){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S2";
    // } else if (currentDiagnoses== 14){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S3";
    // } else if (currentDiagnoses== 15){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S4";
    // } else if (currentDiagnoses== 16){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S5";
    // } else if (currentDiagnoses== 17){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S6";
    // } else if (currentDiagnoses== 18){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S7";
    // } else if (currentDiagnoses== 19){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S8";
    // } else if (currentDiagnoses== 20){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S9";
    // } else if (currentDiagnoses== 21){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S10";
    // }else if (currentDiagnoses== 22){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S11";
    // }else if (currentDiagnoses== 23){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S12";
    // }else if (currentDiagnoses== 24){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S13";
    // }else if (currentDiagnoses== 25){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S14";
    // }else if (currentDiagnoses== 26){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S15";}
    // }else if (currentDiagnoses== 27){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S16";
    // }else if (currentDiagnoses== 28){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S17";
    // }else if (currentDiagnoses== 29){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S18";
    // }else if (currentDiagnoses== 30){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S19";
    // }else if (currentDiagnoses== 31){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S20";
    // }else if (currentDiagnoses== 32){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S21";
    // }else if (currentDiagnoses==33 ){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S22";
    // }else if (currentDiagnoses== 34){
    //   sessionCode = currentDiagnoses;
    //   sessionName = "EX_TRE_S23";
    // }

    final res = await NetWork.get(
        'PatientExams/GetExamQuestionsAnswersByExamCodeAndSectionName/$userId/cog');
        return List.from(res.data["data"])
        .map((e) => Question.fromJson(e))
        .toList();
  }
}
