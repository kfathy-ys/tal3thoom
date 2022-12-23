part of 'booking_cubit.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  final AllBookingModel bookingInfo;

  BookingSuccess({required this.bookingInfo});
}

class BookingError extends BookingState {
  final String msg;

  BookingError({required this.msg});
}
