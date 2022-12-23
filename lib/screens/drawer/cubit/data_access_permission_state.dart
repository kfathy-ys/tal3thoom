part of 'data_access_permission_cubit.dart';

@immutable
abstract class DataAccessPermissionState {}

class DataAccessPermissionInitial extends DataAccessPermissionState {}

class DataAccessPermissionLoading extends DataAccessPermissionState {}

class DataAccessPermissionSuccess extends DataAccessPermissionState {
  final DataAccessPermissionModel accessPermissionModel;

  DataAccessPermissionSuccess({required this.accessPermissionModel});
}

class DataAccessPermissionError extends DataAccessPermissionState {
  final String msg;

  DataAccessPermissionError({required this.msg});
}
