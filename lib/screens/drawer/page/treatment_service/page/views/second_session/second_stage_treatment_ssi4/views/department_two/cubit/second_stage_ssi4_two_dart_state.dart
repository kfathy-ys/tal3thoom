part of 'second_stage_ssi4_two_dart_cubit.dart';

@immutable
abstract class SecondStageSsi4TwoDartState {}

class SecondStageSsi4TwoDartInitial extends SecondStageSsi4TwoDartState {}

class SecondStageSsi4TwoDartLoading extends SecondStageSsi4TwoDartState {}

class SecondStageSsi4TwoDartSuccess extends SecondStageSsi4TwoDartState {
  final List<Question> ssi4QuestionModel;

  SecondStageSsi4TwoDartSuccess({required this.ssi4QuestionModel});
}

class SecondStageSsi4TwoDartError extends SecondStageSsi4TwoDartState {
  final String msg;

  SecondStageSsi4TwoDartError({required this.msg});
}
