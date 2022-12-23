part of 'first_stage_ssrs_cubit.dart';

@immutable
abstract class FirstStageSsrsState {}

class FirstStageSsrsInitial extends FirstStageSsrsState {}

class FirstStageSsrsLoading extends FirstStageSsrsState {}

class FirstStageSsrsSuccess extends FirstStageSsrsState {
  final List<Question> ssrsQuestionModel;

  FirstStageSsrsSuccess({required this.ssrsQuestionModel});
}

class FirstStageSsrsError extends FirstStageSsrsState {
  final String msg;

  FirstStageSsrsError({required this.msg});
}
