part of 'top_three_cubit.dart';

@immutable
abstract class TopThreeState {}

class TopThreeInitial extends TopThreeState {}
class TopThreeLoading extends TopThreeState {}
class TopThreeSuccess extends TopThreeState {
  final TopThreeModels topThreeModels;

  TopThreeSuccess({required this.topThreeModels});
}
class TopThreeError extends TopThreeState {
  final String msg;

  TopThreeError({required this.msg});
}
