part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel model;

  LoginSuccess(this.model);
}

class LoginError extends LoginState {
  final String msg;
  LoginError(this.msg);
}
