part of 'secand_available_dates_cubit.dart';

@immutable
abstract class SecondAvailableDatesState {}

class SecondAvailableDatesInitial extends SecondAvailableDatesState {}

class SecondAvailableDatesLoading extends SecondAvailableDatesState {}

class SecondAvailableDatesSuccess extends SecondAvailableDatesState {
  final DiagnosticReservationAvailableDateModel availableDatesModel;
  final List<DateTime> dates;

  SecondAvailableDatesSuccess(
      {required this.availableDatesModel, required this.dates});
}

class SecondAvailableDatesError extends SecondAvailableDatesState {
  final String msg;

  SecondAvailableDatesError({required this.msg});
}

class AvailableDatesEmpty extends SecondAvailableDatesState {}

class AvailablePeriodLoading extends SecondAvailableDatesState {}

class AvailablePeriodSuccess extends SecondAvailableDatesState {}

class AvailablePeriodError extends SecondAvailableDatesState {
  final String msg;

  AvailablePeriodError({required this.msg});
}
