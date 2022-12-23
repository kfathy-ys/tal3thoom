part of 'diagnostic_payment_cubit.dart';

@immutable
abstract class DiagnosticPaymentState {}

class DiagnosticPaymentInitial extends DiagnosticPaymentState {}

class DiagnosticPaymentLoading extends DiagnosticPaymentState {}

class DiagnosticPaymentSuccess extends DiagnosticPaymentState {
  final PaymentAllTreatmentModel firstPaymentModel;

  DiagnosticPaymentSuccess({required this.firstPaymentModel});
}

class DiagnosticPaymentError extends DiagnosticPaymentState {
  final String msg;

  DiagnosticPaymentError({required this.msg});
}
