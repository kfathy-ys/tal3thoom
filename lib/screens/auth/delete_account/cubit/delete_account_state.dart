part of 'delete_account_cubit.dart';

@immutable
abstract class DeleteAccountState {}

class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoading extends DeleteAccountState {}

class DeleteAccountSuccess extends DeleteAccountState {
  final AllMessages allMessages;

  DeleteAccountSuccess({required this.allMessages});
}

class DeleteAccountError extends DeleteAccountState {
  final String msg;

  DeleteAccountError({required this.msg});
}
