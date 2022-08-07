import 'package:tal3thoom/config/themes/theme_cubit/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchState(isDarkThemeOn: true));

  void toggleSwitch(bool value) => emit(state.copyWith(changeState: value));
}
