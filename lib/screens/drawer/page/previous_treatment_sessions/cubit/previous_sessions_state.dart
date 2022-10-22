part of 'previous_sessions_cubit.dart';

@immutable
abstract class PreviousSessionsState {}

class PreviousSessionsInitial extends PreviousSessionsState {}
class PreviousSessionsLoading extends PreviousSessionsState {}
class PreviousSessionsSuccess extends PreviousSessionsState {}
class PreviousSessionsError extends PreviousSessionsState {
  final String msg;

  PreviousSessionsError({required this.msg});
}
