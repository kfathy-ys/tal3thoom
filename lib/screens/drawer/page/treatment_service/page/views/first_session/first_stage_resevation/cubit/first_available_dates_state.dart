part of 'first_available_dates_cubit.dart';

@immutable
abstract class FirstAvailableDatesState {}

class FirstAvailableDatesInitial extends FirstAvailableDatesState {}

class FirstAvailableDatesLoading extends FirstAvailableDatesState {}

class FirstAvailableDatesSuccess extends FirstAvailableDatesState {
  final DiagnosticReservationAvailableDateModel availableDatesModel;
  final List<DateTime> dates;

  FirstAvailableDatesSuccess(
      {required this.availableDatesModel, required this.dates});
}

class FirstAvailableDatesError extends FirstAvailableDatesState {
  final String msg;

  FirstAvailableDatesError({required this.msg});
}

class AvailableDatesEmpty extends FirstAvailableDatesState {}

class AvailablePeriodLoading extends FirstAvailableDatesState {}

class AvailablePeriodSuccess extends FirstAvailableDatesState {}

class AvailablePeriodError extends FirstAvailableDatesState {
  final String msg;

  AvailablePeriodError({required this.msg});
}
