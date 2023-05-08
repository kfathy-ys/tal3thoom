part of 'finished_sessions_cubit.dart';

@immutable
abstract class FinishedSessionsState {}

class FinishedSessionsInitial extends FinishedSessionsState {}
class FinishedSessionsLoading extends FinishedSessionsState {}
class FinishedSessionsSuccess extends FinishedSessionsState {

  final AllBookingModel bookingInfo;

  FinishedSessionsSuccess({required this.bookingInfo});
}
class FinishedSessionsError extends FinishedSessionsState {
  final String msg;

  FinishedSessionsError({required this.msg});
}
