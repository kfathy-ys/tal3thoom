
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/advisor_model.dart';

part 'advisor_profile_state.dart';

class AdvisorProfileCubit extends Cubit<AdvisorProfileState> {
  AdvisorProfileCubit() : super(AdvisorProfileInitial());

  AdvisorProfile? selectedAdvisor;
  void onAdvChange(AdvisorProfile value) => selectedAdvisor = value;


}
