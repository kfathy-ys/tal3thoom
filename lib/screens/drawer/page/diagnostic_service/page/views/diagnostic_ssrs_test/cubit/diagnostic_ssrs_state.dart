part of 'diagnostic_ssrs_cubit.dart';

@immutable
abstract class DiagnosticSsrsState {}

class DiagnosticSsrsInitial extends DiagnosticSsrsState {}

class DiagnosticSsrsLoading extends DiagnosticSsrsState {}

class DiagnosticSsrsSuccess extends DiagnosticSsrsState {
  final List<Question> ssrsQuestionModel;

  DiagnosticSsrsSuccess({required this.ssrsQuestionModel});
}

class DiagnosticSsrsError extends DiagnosticSsrsState {
  final String msg;

  DiagnosticSsrsError({required this.msg});
}
