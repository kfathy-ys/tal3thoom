part of 'first_stage_ssi4_one_cubit.dart';

@immutable
abstract class FirstStageSsi4OneState {}

class FirstStageSsi4OneInitial extends FirstStageSsi4OneState {}

class FirstStageSsi4OneLoading extends FirstStageSsi4OneState {}

class FirstStageSsi4OneSuccess extends FirstStageSsi4OneState {
  final List<Question> ssi4QuestionModel;

  FirstStageSsi4OneSuccess({required this.ssi4QuestionModel});
}

class FirstStageSsi4OneError extends FirstStageSsi4OneState {
  final String msg;

  FirstStageSsi4OneError({required this.msg});
}
