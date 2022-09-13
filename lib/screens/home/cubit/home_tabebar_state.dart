part of 'home_tabebar_cubit.dart';

@immutable
abstract class HomeTabeBarState {}

class HomeTabeBarInitial extends HomeTabeBarState {}

class HomeTabeBarLoading extends HomeTabeBarState {}

class HomeTabeBarChanged extends HomeTabeBarState {}

class HomeTabeBarError extends HomeTabeBarState {}
