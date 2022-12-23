part of 'new_password_cubit.dart';

@immutable
abstract class NewPasswordState {}

class NewPasswordInitial extends NewPasswordState {}

class NewPasswordLoading extends NewPasswordState {}

class NewPasswordSuccess extends NewPasswordState {
  final ForgetPasswordModel forgetPasswordModel;

  NewPasswordSuccess({required this.forgetPasswordModel});
}

class NewPasswordError extends NewPasswordState {
  final String msg;

  NewPasswordError({required this.msg});
}
