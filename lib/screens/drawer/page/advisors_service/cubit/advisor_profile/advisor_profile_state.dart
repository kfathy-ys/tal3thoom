part of 'advisor_profile_cubit.dart';

@immutable
abstract class AdvisorProfileState {}

class AdvisorProfileInitial extends AdvisorProfileState {}
class AdvisorProfileLoading extends AdvisorProfileState {}
class AdvisorProfileSuccess extends AdvisorProfileState {
  final List<AllAdvisors > advisorProfile;

  AdvisorProfileSuccess({required this.advisorProfile});
}
class AdvisorProfileError extends AdvisorProfileState {
  final String msg;

  AdvisorProfileError({required this.msg});
}
