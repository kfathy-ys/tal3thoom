part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordModel forgetPasswordModel;

  ForgetPasswordSuccess({required this.forgetPasswordModel});
}

class ForgetPasswordError extends ForgetPasswordState {
  final String msg;

  ForgetPasswordError({required this.msg});
}
