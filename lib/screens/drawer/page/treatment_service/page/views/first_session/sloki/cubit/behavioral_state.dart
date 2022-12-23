part of 'behavioral_cubit.dart';

@immutable
abstract class BehavioralState {}

class BehavioralInitial extends BehavioralState {}

class BehavioralLoading extends BehavioralState {}

class BehavioralSuccess extends BehavioralState {
  final List<Question> behavioralSection;

  BehavioralSuccess({required this.behavioralSection});
}

class BehavioralError extends BehavioralState {
  final String msg;

  BehavioralError({required this.msg});
}
