import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/models/diagnostic_payment_model.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_treatment_session/view.dart';

import '../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../widgets/alerts.dart';
import '../../../../../treatment_service/page/views/pre-treatment_questionnaire/view.dart';
import '../../../../../treatment_service/page/views/second_session/second_treatment_sessions/view.dart';
import '../../diagnostic_history/view.dart';
import '../view.dart';

part 'diagnostic_payment_state.dart';

class DiagnosticPaymentCubit extends Cubit<DiagnosticPaymentState> {
  DiagnosticPaymentCubit() : super(DiagnosticPaymentInitial()) {
    getDiagnosticPayment();
  }

  DiagnosticPaymentModel? diagnosticPaymentModel;

  Future<void> getDiagnosticPayment() async {
    emit(DiagnosticPaymentLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'SubscriptionStages/GetPatientSubscriptionStages/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(DiagnosticPaymentSuccess(
          diagnosticPaymentModel: DiagnosticPaymentModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(DiagnosticPaymentError(msg: e.toString()));
    }
  }

  checkDiagnosticPayment() async {
    final userId = Prefs.getString("userId");
    final res = await NetWork.get(
        'SubscriptionStages/GetPatientSubscriptionStages/$userId');
    diagnosticPaymentModel = DiagnosticPaymentModel.fromJson(res.data);
    print(diagnosticPaymentModel?.data!.toString());
    print(diagnosticPaymentModel?.toJson());
    print(diagnosticPaymentModel?.data!.length);
    //  print("Mohamed 0 " );

    if (diagnosticPaymentModel!.data!.isEmpty) {
      //   print(diagnosticPaymentModel?.data![0]);
      // print(diagnosticPaymentModel?.data![1]);

      Alert.error("الرجاء إتمام عملية الدفع",
          desc:
              "عزيزي العميل الرجاء الضغط علي الباقة المدونه واتباع الخطوات اللازمة للاتمام العملية");
      Get.to(() => const DiagnosticPayment());
    }
    else if (diagnosticPaymentModel?.data!.contains(1) == true) {
      print("التاريخ المرضي ");
      Alert.success("تم العملية بنجاح",
          desc: "تم عملية الدفع المسبقة بشكل صحيح");
      Get.off(() => const DiagnosticHistory());
    } else if (diagnosticPaymentModel?.data!.contains(1) == true &&
        diagnosticPaymentModel?.data!.contains(2) == true) {
      print("Mohamed 2 ");
      //   print(diagnosticPaymentModel?.data![0]);
      //  print(diagnosticPaymentModel?.data![1]);
      Alert.success("تم العملية بنجاح",
          desc: "تم عملية الدفع المسبقة بشكل صحيح");
      Get.to(() => const PretreatmentQuestionnaire());
    } else if (diagnosticPaymentModel?.data!.contains(1) == true &&
        diagnosticPaymentModel?.data!.contains(2) == true &&
        diagnosticPaymentModel?.data!.contains(4) == true) {
      print("Mohamed 2 ");
      //   print(diagnosticPaymentModel?.data![0]);
      //  print(diagnosticPaymentModel?.data![1]);
      Alert.success("تم العملية بنجاح",
          desc: "تم عملية الدفع المسبقة بشكل صحيح");
      Get.to(() => const SecondTreatmentSession());
    } else {
      //   print(diagnosticPaymentModel?.data![0]);
      // print(diagnosticPaymentModel?.data![1]);
      //  Get.to(() => DiagnosticPayment());
      Alert.error("الرجاء إتمام عملية الدفع",
          desc:
          "عزيزي العميل الرجاء الضغط علي الباقة المدونه واتباع الخطوات اللازمة للاتمام العملية");
    }
  }
}
