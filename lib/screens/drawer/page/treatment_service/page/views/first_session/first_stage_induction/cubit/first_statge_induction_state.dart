part of 'first_statge_induction_cubit.dart';

@immutable
abstract class FirstStageInductionState {}

class FirstStageInductionInitial extends FirstStageInductionState {}

class FirstStageInductionLoading extends FirstStageInductionState {}

class FirstStageInductionSuccess extends FirstStageInductionState {
  final InductionDiagnosticModel inductionDiagnosticModel;

  FirstStageInductionSuccess({required this.inductionDiagnosticModel});
}

class FirstStageInductionError extends FirstStageInductionState {
  final String msg;

  FirstStageInductionError({required this.msg});
}
