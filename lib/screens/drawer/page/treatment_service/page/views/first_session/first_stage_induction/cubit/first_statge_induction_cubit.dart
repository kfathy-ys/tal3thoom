import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_induction/models/induction_model.dart';

import '../../../../../../../../../config/dio_helper/dio.dart';

part 'first_statge_induction_state.dart';

class FirstStageInductionCubit extends Cubit<FirstStageInductionState> {
  FirstStageInductionCubit() : super(FirstStageInductionInitial()) {
    getFirstInduction();
  }

  Future<void> getFirstInduction() async {
    emit(FirstStageInductionLoading());

    try {
      final res = await NetWork.get('Stages/GetStageInstructions/2');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(FirstStageInductionSuccess(
          inductionDiagnosticModel:
              InductionDiagnosticModel.fromJson(res.data)));
    } on DioError catch (_) {
      emit(FirstStageInductionError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(FirstStageInductionError(msg: e.toString()));
    }
  }
}
