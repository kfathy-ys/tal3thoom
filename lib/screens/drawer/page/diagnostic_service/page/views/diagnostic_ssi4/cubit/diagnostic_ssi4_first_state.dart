part of 'diagnostic_ssi4_first_cubit.dart';

@immutable
abstract class DiagnosticSsi4FirstState {}

class DiagnosticSsi4FirstInitial extends DiagnosticSsi4FirstState {}

class DiagnosticSsi4FirstLoading extends DiagnosticSsi4FirstState {}

class DiagnosticSsi4FirstSuccess extends DiagnosticSsi4FirstState {
  final List<Question> ssi4QuestionModel;

  DiagnosticSsi4FirstSuccess({required this.ssi4QuestionModel});
}

class DiagnosticSsi4FirstError extends DiagnosticSsi4FirstState {
  final String msg;

  DiagnosticSsi4FirstError({required this.msg});
}
