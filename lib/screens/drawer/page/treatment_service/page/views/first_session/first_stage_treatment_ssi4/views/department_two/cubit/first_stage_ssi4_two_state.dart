part of 'first_stage_ssi4_two_cubit.dart';

@immutable
abstract class FirstStageSsi4TwoState {}

class FirstStageSsi4TwoInitial extends FirstStageSsi4TwoState {}

class FirstStageSsi4TwoLoading extends FirstStageSsi4TwoState {}

class FirstStageSsi4TwoSuccess extends FirstStageSsi4TwoState {
  final List<Question> ssi4QuestionModel;

  FirstStageSsi4TwoSuccess({required this.ssi4QuestionModel});
}

class FirstStageSsi4TwoError extends FirstStageSsi4TwoState {
  final String msg;

  FirstStageSsi4TwoError({required this.msg});
}
