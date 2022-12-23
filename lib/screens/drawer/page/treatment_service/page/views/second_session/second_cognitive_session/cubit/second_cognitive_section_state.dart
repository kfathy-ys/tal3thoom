part of 'second_cognitive_section_cubit.dart';

@immutable
abstract class SecondCognitiveSectionState {}

class SecondCognitiveSectionInitial extends SecondCognitiveSectionState {}

class SecondCognitiveSectionLoading extends SecondCognitiveSectionState {}

class SecondCognitiveSectionSuccess extends SecondCognitiveSectionState {
  final List<Question> questionModel;

  SecondCognitiveSectionSuccess({required this.questionModel});
}

class SecondCognitiveSectionError extends SecondCognitiveSectionState {
  final String msg;

  SecondCognitiveSectionError({required this.msg});
}
