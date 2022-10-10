part of 'diangosic_specialists_cubit.dart';

@immutable
abstract class DiagnosticSpecialistsState {}

class DiagnosticSpecialistsInitial extends DiagnosticSpecialistsState {}
class DiagnosticSpecialistsLoading extends DiagnosticSpecialistsState {}
class DiagnosticSpecialistsSuccess extends DiagnosticSpecialistsState {
  final AllSpecialistModel allSpecialistModel;

  DiagnosticSpecialistsSuccess({required this.allSpecialistModel});
}
class DiagnosticSpecialistsError extends DiagnosticSpecialistsState {
  final String msg;

  DiagnosticSpecialistsError({required this.msg});
}
