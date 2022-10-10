part of 'available_dates_cubit.dart';

@immutable
abstract class AvailableDatesState {}

class AvailableDatesInitial extends AvailableDatesState {}

class AvailableDatesLoading extends AvailableDatesState {}

class AvailableDatesSuccess extends AvailableDatesState {
  final DiagnosticReservationAvailableDateModel availableDatesModel;
  final List<DateTime> dates;
 // final List<AllAvailableDates> dates;

  AvailableDatesSuccess(
      {required this.dates, required this.availableDatesModel});
}

class AvailableDatesError extends AvailableDatesState {
  final String msg;

  AvailableDatesError({required this.msg});
}

class AvailableDatesEmpty extends AvailableDatesState {}



class AvailablePeriodLoading extends AvailableDatesState {}

class AvailablePeriodSuccess extends AvailableDatesState {}

class AvailablePeriodError extends AvailableDatesState {
  final String msg;

  AvailablePeriodError({required this.msg});
}