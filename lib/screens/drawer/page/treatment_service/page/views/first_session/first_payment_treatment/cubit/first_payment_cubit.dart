import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../../../config/dio_helper/dio.dart';
import '../models/payment_treatement_model.dart';

part 'first_payment_state.dart';

class FirstPaymentCubit extends Cubit<FirstPaymentState> {
  FirstPaymentCubit() : super(FirstPaymentInitial()) {
    getFirstPayment();
  }

  //PaymentAllTreatmentModel? diagnosticPaymentModel;

  Future<void> getFirstPayment() async {
    emit(FirstPaymentLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'SubscriptionStages/GetPatientSubscriptionStagesWithSubscritptions/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(FirstPaymentSuccess(
          firstPaymentModel: PaymentAllTreatmentModel.fromJson(res.data)));
    } on DioError catch (_) {
      emit(FirstPaymentError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(FirstPaymentError(msg: e.toString()));
    }
  }
}
