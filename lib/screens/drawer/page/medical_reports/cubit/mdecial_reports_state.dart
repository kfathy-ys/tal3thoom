part of 'medical_reports_cubit.dart';

@immutable
abstract class MedicalsState {}

class MedicalsInitial extends MedicalsState {}
class MedicalsLoading extends MedicalsState {}
class MedicalsSuccess extends MedicalsState {
  final List<AllReports> allReports ;
  MedicalsSuccess({required this.allReports});
}
class MedicalsError extends MedicalsState {
  final String msg;

  MedicalsError({required this.msg});

}
