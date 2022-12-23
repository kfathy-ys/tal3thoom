part of 'second_evaluation_cubit.dart';

@immutable
abstract class SecondEvaluationState {}

class SecondEvaluationInitial extends SecondEvaluationState {}

class SecondEvaluationLoading extends SecondEvaluationState {}

class SecondEvaluationSuccess extends SecondEvaluationState {
  final List<Question> questionEvaluation;

  SecondEvaluationSuccess({required this.questionEvaluation});
}

class SecondEvaluationError extends SecondEvaluationState {
  final String msg;

  SecondEvaluationError({required this.msg});
}
