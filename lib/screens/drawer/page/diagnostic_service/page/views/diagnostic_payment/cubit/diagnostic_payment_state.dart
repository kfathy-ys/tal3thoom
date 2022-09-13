part of 'diagnostic_payment_cubit.dart';

@immutable
abstract class DiagnosticPaymentState {}

class DiagnosticPaymentInitial extends DiagnosticPaymentState {}

class DiagnosticPaymentLoading extends DiagnosticPaymentState {}

class DiagnosticPaymentSuccess extends DiagnosticPaymentState {
  final DiagnosticPaymentModel diagnosticPaymentModel;

  DiagnosticPaymentSuccess({required this.diagnosticPaymentModel});
}

class DiagnosticPaymentError extends DiagnosticPaymentState {
  final String msg;

  DiagnosticPaymentError({required this.msg});
}
