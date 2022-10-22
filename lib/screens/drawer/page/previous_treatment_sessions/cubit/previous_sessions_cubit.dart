import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'previous_sessions_state.dart';

class PreviousSessionsCubit extends Cubit<PreviousSessionsState> {
  PreviousSessionsCubit() : super(PreviousSessionsInitial());
  String? typeSessionId;
  String onSessionTypeChanged(String value) => typeSessionId = value;


}
