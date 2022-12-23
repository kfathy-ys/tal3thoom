part of 'all_specialist__first_sessions_cubit.dart';

@immutable
abstract class AllSpecialistFirstSessionsState {}

class AllSpecialistFirstSessionsInitial
    extends AllSpecialistFirstSessionsState {}

class FirstSessionsSpecialistsLoading extends AllSpecialistFirstSessionsState {}

class FirstSessionsSpecialistsSuccess extends AllSpecialistFirstSessionsState {
  final AllSpecialistModel allSpecialistModel;

  FirstSessionsSpecialistsSuccess({required this.allSpecialistModel});
}

class FirstSessionsSpecialistsError extends AllSpecialistFirstSessionsState {
  final String msg;

  FirstSessionsSpecialistsError({required this.msg});
}
