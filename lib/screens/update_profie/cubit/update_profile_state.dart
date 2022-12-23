part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final AllProfile profileModel;

  UpdateProfileSuccess({required this.profileModel});
}

class UpdateProfileError extends UpdateProfileState {
  final String msg;

  UpdateProfileError({required this.msg});
}
