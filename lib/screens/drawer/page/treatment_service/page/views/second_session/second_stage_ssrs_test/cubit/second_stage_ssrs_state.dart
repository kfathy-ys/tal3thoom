part of 'second_stage_ssrs_cubit.dart';

@immutable
abstract class SecondStageSsrsState {}

class SecondStageSsrsInitial extends SecondStageSsrsState {}

class SecondStageSsrsLoading extends SecondStageSsrsState {}

class SecondStageSsrsSuccess extends SecondStageSsrsState {
  final List<Question> ssrsQuestionModel;

  SecondStageSsrsSuccess({required this.ssrsQuestionModel});
}

class SecondStageSsrsError extends SecondStageSsrsState {
  final String msg;

  SecondStageSsrsError({required this.msg});
}
