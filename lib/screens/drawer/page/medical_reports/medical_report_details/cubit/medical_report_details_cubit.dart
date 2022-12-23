import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../models/medcial_report_model.dart';

part 'medical_report_details_state.dart';

class MedicalReportDetailsCubit extends Cubit<MedicalReportDetailsState> {
  final AllReports allReportsDetails;
  MedicalReportDetailsCubit({required this.allReportsDetails})
      : super(MedicalReportDetailsInitial()) {
    getReportsDetails(id: allReportsDetails.id!);
  }

  //var allReports = <AllReports>[];

  Future<void> getReportsDetails({required int id}) async {
    emit(MedicalReportDetailsLoading());
    try {
      // allReports=  await AllReportsDetailsService.findMany(reportId: id);
      final res =
          await NetWork.get('Report/GetDiagnosisReportByReportIdMobile/$id');

      print("before");
      emit(MedicalReportDetailsSuccess(
          allReports: MedicalReportsModel.fromJson(res.data)));

      var x = MedicalReportsModel.fromJson(res.data);
      print(x.data!.reportName.toString() + "khaleddddddddddd");
    } on DioError catch (_) {
      emit(MedicalReportDetailsError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(MedicalReportDetailsError(msg: e.toString()));
    }
  }
}
