
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/advisor_model.dart';
import '../../models/all_time_model.dart';
import '../../models/profile_dtails.dart';

part 'advisor_profile_state.dart';

class AdvisorProfileCubit extends Cubit<AdvisorProfileState> {
  AdvisorProfileCubit() : super(AdvisorProfileInitial());

  AllAdvisors? selectedAdvisor;
  void onAdvChange(AllAdvisors value) => selectedAdvisor = value;


  int? selectedTime;
  void onTimeChange(int value) => selectedTime = value;


}
