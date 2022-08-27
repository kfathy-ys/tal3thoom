part of 'diagnostic_history_question_cubit.dart';

@immutable
abstract class DiagnosticHistoryQuestionState {}

class DiagnosticHistoryQuestionInitial extends DiagnosticHistoryQuestionState {}
class DiagnosticHistoryQuestionLoading extends DiagnosticHistoryQuestionState {}
class DiagnosticHistoryQuestionSuccess extends DiagnosticHistoryQuestionState {
  final List <Data>  diagnosticHistoryQuestionModel;

  DiagnosticHistoryQuestionSuccess({required this.diagnosticHistoryQuestionModel});
}
class DiagnosticHistoryQuestionError extends DiagnosticHistoryQuestionState {
  final String msg;

  DiagnosticHistoryQuestionError({required this.msg});
}
