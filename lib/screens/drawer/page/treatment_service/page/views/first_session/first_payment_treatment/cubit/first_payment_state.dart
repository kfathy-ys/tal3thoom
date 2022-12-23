part of 'first_payment_cubit.dart';

@immutable
abstract class FirstPaymentState {}

class FirstPaymentInitial extends FirstPaymentState {}

class FirstPaymentLoading extends FirstPaymentState {}

class FirstPaymentSuccess extends FirstPaymentState {
  final PaymentAllTreatmentModel firstPaymentModel;

  FirstPaymentSuccess({required this.firstPaymentModel});
}

class FirstPaymentError extends FirstPaymentState {
  final String msg;

  FirstPaymentError({required this.msg});
}
