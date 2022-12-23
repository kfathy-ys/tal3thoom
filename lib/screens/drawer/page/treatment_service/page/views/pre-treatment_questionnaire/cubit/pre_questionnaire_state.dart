part of 'pre_questionnaire_cubit.dart';

@immutable
abstract class PreQuestionnaireState {}

class PreQuestionnaireInitial extends PreQuestionnaireState {}

class PreQuestionnaireLoading extends PreQuestionnaireState {}

class PreQuestionnaireSuccess extends PreQuestionnaireState {
  final List<Question> preQuestionnaireModel;

  PreQuestionnaireSuccess({required this.preQuestionnaireModel});
}

class PreQuestionnaireError extends PreQuestionnaireState {
  final String msg;

  PreQuestionnaireError({required this.msg});
}
