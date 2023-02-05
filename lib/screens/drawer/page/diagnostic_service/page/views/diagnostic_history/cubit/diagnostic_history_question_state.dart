part of 'diagnostic_history_question_cubit.dart';

@immutable
abstract class DiagnosticHistoryQuestionState {}

class DiagnosticHistoryQuestionInitial extends DiagnosticHistoryQuestionState {}

class DiagnosticHistoryQuestionLoading extends DiagnosticHistoryQuestionState {}

class DiagnosticHistoryQuestionSuccess extends DiagnosticHistoryQuestionState {
  final List<Question> diagnosticHistoryQuestionModel;
  DiagnosticHistoryQuestionSuccess(
      {required this.diagnosticHistoryQuestionModel});
}

class DiagnosticHistoryQuestionMessage extends DiagnosticHistoryQuestionState {
  final List<Message> message;
  DiagnosticHistoryQuestionMessage({required this.message});
}

class DiagnosticHistoryQuestionError extends DiagnosticHistoryQuestionState {
  final String msg;
  Message? message;

  DiagnosticHistoryQuestionError({required this.msg,this.message});
}
