part of 'vcode_cubit.dart';

@immutable
abstract class VcodeState {}

class VcodeInitial extends VcodeState {}

class VcodeILoading extends VcodeState {}

class VcodeSuccess extends VcodeState {
  final ForgetPasswordModel forgetPasswordModel;

  VcodeSuccess({required this.forgetPasswordModel});
}

class VcodeError extends VcodeState {
  final String msg;

  VcodeError({required this.msg});
}
