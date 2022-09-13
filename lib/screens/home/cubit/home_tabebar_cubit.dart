import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../pages/views/home_page/view.dart';
import '../pages/views/profile/view.dart';
import '../pages/views/reservations_schedule/view.dart';

part 'home_tabebar_state.dart';

class HomeTabeBarCubit extends Cubit<HomeTabeBarState> {
  HomeTabeBarCubit() : super(HomeTabeBarInitial());
  int index = 1;
  // final bottomNavigationKey = GlobalKey();
  final widgetOptions = <Widget>[
    const Profile(),
    MyHomeScreen(),
    const ReservationsSchedule(),
  ];
  void changeIndex(int indexed) {
    index = indexed;
    emit(HomeTabeBarChanged());
  }
}
