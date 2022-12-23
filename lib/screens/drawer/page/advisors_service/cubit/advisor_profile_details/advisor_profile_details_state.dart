part of 'advisor_profile_details_cubit.dart';

@immutable
abstract class AdvisorProfileDetailsState {}

class AdvisorProfileDetailsInitial extends AdvisorProfileDetailsState {}

class AdvisorProfileDetailsLoading extends AdvisorProfileDetailsState {}

class AdvisorProfileDetailsSuccess extends AdvisorProfileDetailsState {
  final AdvisorProfile advisorProfile;

  AdvisorProfileDetailsSuccess({required this.advisorProfile});
}

class AdvisorProfileDetailsError extends AdvisorProfileDetailsState {
  final String msg;

  AdvisorProfileDetailsError({required this.msg});
}
