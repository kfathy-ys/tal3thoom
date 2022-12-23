import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../treatment_service/page/views/first_session/first_payment_treatment/models/payment_treatement_model.dart';

part 'diagnostic_payment_state.dart';

class DiagnosticPaymentCubit extends Cubit<DiagnosticPaymentState> {
  DiagnosticPaymentCubit() : super(DiagnosticPaymentInitial()) {
    getDiagnosticPayment();
  }

  Future<void> getDiagnosticPayment() async {
    emit(DiagnosticPaymentLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'SubscriptionStages/GetPatientSubscriptionStagesWithSubscritptions/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(DiagnosticPaymentSuccess(
          firstPaymentModel: PaymentAllTreatmentModel.fromJson(res.data)));
    } on DioError catch (_) {
      emit(DiagnosticPaymentError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(DiagnosticPaymentError(msg: e.toString()));
    }
  }
}
