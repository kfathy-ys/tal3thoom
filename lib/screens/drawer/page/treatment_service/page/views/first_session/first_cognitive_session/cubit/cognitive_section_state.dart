part of 'cognitive_section_cubit.dart';

@immutable
abstract class CognitiveSectionState {}

class CognitiveSectionInitial extends CognitiveSectionState {}

class CognitiveSectionLoading extends CognitiveSectionState {}

class CognitiveSectionSuccess extends CognitiveSectionState {
  final List<Question> questionModel;

  CognitiveSectionSuccess({required this.questionModel});
}

class CognitiveSectionError extends CognitiveSectionState {
  final String msg;

  CognitiveSectionError({required this.msg});
}
