part of 'all_specialist__second_sessions_cubit.dart';

@immutable
abstract class AllSpecialistSecondSessionsState {}

class AllSpecialistSecondSessionsInitial
    extends AllSpecialistSecondSessionsState {}

class AllSpecialistSecondSessionsLoading
    extends AllSpecialistSecondSessionsState {}

class AllSpecialistSecondSessionsSuccess
    extends AllSpecialistSecondSessionsState {
  final AllSpecialistModel allSpecialistModel;

  AllSpecialistSecondSessionsSuccess({required this.allSpecialistModel});
}

class AllSpecialistSecondSessionsError
    extends AllSpecialistSecondSessionsState {
  final String msg;

  AllSpecialistSecondSessionsError({required this.msg});
}
