import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../../config/dio_helper/dio.dart';
import '../models/induction_model.dart';

part 'diagnostic_induction_state.dart';

class DiagnosticInductionCubit extends Cubit<DiagnosticInductionState> {
  DiagnosticInductionCubit() : super(DiagnosticInductionInitial()) {
    getDiagnosticInduction();
  }

  Future<void> getDiagnosticInduction() async {
    emit(DiagnosticInductionLoading());

    try {
      final res = await NetWork.get('Stages/GetStageInstructions/1');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(DiagnosticInductionSuccess(
          inductionDiagnosticModel:
              InductionDiagnosticModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(DiagnosticInductionError(meg: e.toString()));
    }
  }
}
