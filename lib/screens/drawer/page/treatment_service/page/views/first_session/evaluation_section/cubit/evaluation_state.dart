part of 'evaluation_cubit.dart';

@immutable
abstract class EvaluationState {}

class EvaluationInitial extends EvaluationState {}

class EvaluationLoading extends EvaluationState {}

class EvaluationSuccess extends EvaluationState {
  final List<Question> questionEvaluation;

  EvaluationSuccess({required this.questionEvaluation});
}

class EvaluationError extends EvaluationState {
  final String msg;

  EvaluationError({required this.msg});
}
