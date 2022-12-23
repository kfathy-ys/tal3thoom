part of 'second_behavioral_cubit.dart';

@immutable
abstract class SecondBehavioralState {}

class SecondBehavioralInitial extends SecondBehavioralState {}

class SecondBehavioralLoading extends SecondBehavioralState {}

class SecondBehavioralSuccess extends SecondBehavioralState {
  final List<Question> behavioralSection;

  SecondBehavioralSuccess({required this.behavioralSection});
}

class SecondBehavioralError extends SecondBehavioralState {
  final String msg;

  SecondBehavioralError({required this.msg});
}
