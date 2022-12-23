part of 'second_stage_ssi4_one_cubit.dart';

@immutable
abstract class SecondStageSsi4OneState {}

class SecondStageSsi4OneInitial extends SecondStageSsi4OneState {}

class SecondStageSsi4OneLoading extends SecondStageSsi4OneState {}

class SecondStageSsi4OneSuccess extends SecondStageSsi4OneState {
  final List<Question> ssi4QuestionModel;

  SecondStageSsi4OneSuccess({required this.ssi4QuestionModel});
}

class SecondStageSsi4OneError extends SecondStageSsi4OneState {
  final String msg;

  SecondStageSsi4OneError({required this.msg});
}
