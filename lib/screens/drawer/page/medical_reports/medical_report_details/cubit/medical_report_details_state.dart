part of 'medical_report_details_cubit.dart';

@immutable
abstract class MedicalReportDetailsState {}

class MedicalReportDetailsInitial extends MedicalReportDetailsState {}

class MedicalReportDetailsLoading extends MedicalReportDetailsState {}

class MedicalReportDetailsSuccess extends MedicalReportDetailsState {
  final MedicalReportsModel allReports;

  MedicalReportDetailsSuccess({required this.allReports});
}

class MedicalReportDetailsError extends MedicalReportDetailsState {
  final String msg;

  MedicalReportDetailsError({required this.msg});
}
