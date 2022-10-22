import 'dart:developer';
import 'package:dio/dio.dart' as _dio;

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import 'package:tal3thoom/serives/first_stage_injects/sessions/behavioral_section/question_serives.dart';

import '../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../widgets/alerts.dart';

part 'behavioral_state.dart';

class BehavioralCubit extends Cubit<BehavioralState> {
  BehavioralCubit() : super(BehavioralInitial()){
    getBehavioralSection();
  }


  var userId = Prefs.getString("userId");
  final questionList = <Question>[];

  final answer = <Question, Answers>{};
  final answersTxt = <Question, String>{};

  Future<void> getBehavioralSection() async {
    emit(BehavioralLoading());
    try {
      questionList
          .assignAll(await BehavioralSectionService.findMany());

      print(questionList);

      emit(BehavioralSuccess(behavioralSection: questionList));
    } catch (e, es) {
      print("err");
      log(e.toString());
      log(es.toString());
      emit(BehavioralError(msg: e.toString()));
    }
  }

  Future<void> postUploadVideo({
    required int questionId,
    required int examId,
    required dynamic video,
  }) async {
    final currentStage = Prefs.getString("currentStage");
    final currentDiagnoses = Prefs.getString("currentDiagnoses");

    final String sessionCode;
    String examCode ="EX_TRE_S1" ;


    if(currentDiagnoses== 12){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S1";
    }
    else if (currentDiagnoses== 13){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S2";
    } else if (currentDiagnoses== 14){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S3";
    } else if (currentDiagnoses== 15){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S4";
    } else if (currentDiagnoses== 16){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S5";
    } else if (currentDiagnoses== 17){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S6";
    } else if (currentDiagnoses== 18){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S7";
    } else if (currentDiagnoses== 19){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S8";
    } else if (currentDiagnoses== 20){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S9";
    } else if (currentDiagnoses== 21){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S10";
    }else if (currentDiagnoses== 22){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S11";
    }else if (currentDiagnoses== 23){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S12";
    }else if (currentDiagnoses== 24){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S13";
    }else if (currentDiagnoses== 25){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S14";
    }else if (currentDiagnoses== 26){
      sessionCode = currentDiagnoses;
      examCode = "EX_TRE_S15";}
    final formData = _dio.FormData.fromMap({
      "record": _dio.MultipartFile.fromFileSync(video.path,
          filename: video.path),
    });
    try {
      final body = formData;
      final res = await NetWork.post(
          'PatientExams/AddPatienVideoExamAnswer/$userId/$examId/$examCode/$questionId/2',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(BehavioralSuccess(behavioralSection:  questionList));
      Alert.success('تم رفع الفيديو بنجاح');

    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(BehavioralError(msg: e.toString()));
    }
  }
}
