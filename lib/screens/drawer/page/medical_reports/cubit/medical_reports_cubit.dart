import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../../serives/medcial_reports/report_list.dart';
import '../models/medcial_report_model.dart';

part 'mdecial_reports_state.dart';

class MedicalReportsCubit extends Cubit<MedicalsState> {
  MedicalReportsCubit() : super(MedicalsInitial()) {
    getReports();
  }

  final allReports = <AllReports>[];

  Future<void> getReports() async {
    emit(MedicalsLoading());
    try {
      allReports.assignAll(await AllReportsService.findMany());

      print(allReports);
      emit(MedicalsSuccess(allReports: allReports));
    } on DioError catch (_) {
      emit(MedicalsError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(MedicalsError(msg: e.toString()));
    }
  }
}
