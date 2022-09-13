part of 'diagnostic_induction_cubit.dart';

@immutable
abstract class DiagnosticInductionState {}

class DiagnosticInductionInitial extends DiagnosticInductionState {}

class DiagnosticInductionLoading extends DiagnosticInductionState {}

class DiagnosticInductionSuccess extends DiagnosticInductionState {
  final InductionDiagnosticModel inductionDiagnosticModel;

  DiagnosticInductionSuccess({required this.inductionDiagnosticModel});
}

class DiagnosticInductionError extends DiagnosticInductionState {
  final String meg;

  DiagnosticInductionError({required this.meg});
}
