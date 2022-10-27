import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../../../../config/dio_helper/dio.dart';
import '../../../../../../../../widgets/alerts.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_history/view.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_payment/models/diagnostic_payment_model.dart';
import '../../../../../../diagnostic_service/page/views/diagnostic_payment/models/package_model.dart';
import '../../../pre-treatment_questionnaire/view.dart';
import '../../../second_session/second_treatment_sessions/view.dart';
import '../../first_stage_induction/view.dart';
import '../../first_treatment_session/view.dart';
import '../models/payment_treatement_model.dart';
import '../view.dart';

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
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(FirstPaymentError(msg: e.toString()));
    }
  }

/*
  checkFirstPayment() async {


      if (diagnosticPaymentModel!.data!.subscriptionStages!.isEmpty) {
        //   print(diagnosticPaymentModel?.data![0]);
        //  print(diagnosticPaymentModel?.data!.contains(1)==true);
        //  print("ايووووووووووووووة");

        Alert.error("الرجاء إتمام عملية الدفع",
            desc:
            "عزيزي العميل الرجاء الضغط علي الباقة المدونه واتباع الخطوات اللازمة للاتمام العملية");
        Get.to(() => const FirstPaymentTreatment());
      } else if ((diagnosticPaymentModel?.data!.subscriptionStages!.contains(2)) == true &&
          (diagnosticPaymentModel?.data!.subscriptionStages!.contains(4)) == true) {
        print("Mohamed 2 ");
        //   print(diagnosticPaymentModel?.data![0]);
        //  print(diagnosticPaymentModel?.data![1]);
        Alert.success("تم العملية بنجاح",
            desc: "تم عملية الدفع المسبقة بشكل صحيح");
        Get.off(() => const PretreatmentQuestionnaire());
      } else if (diagnosticPaymentModel?.data!.subscriptionStages!.contains(1) == true) {
        print("التاريخ المرضي ");
        Alert.success("تم العملية بنجاح",
            desc: "تم عملية الدفع المسبقة بشكل صحيح");
        Get.off(() => const DiagnosticHistory());
      } else if (diagnosticPaymentModel?.data!.subscriptionStages!.contains(1) == true &&
          diagnosticPaymentModel?.data!.subscriptionStages!.contains(2) == true &&
          diagnosticPaymentModel?.data!.subscriptionStages!.contains(4) == true) {
        print("Mohamed 2 ");
        //   print(diagnosticPaymentModel?.data![0]);
        //  print(diagnosticPaymentModel?.data![1]);
        Alert.success("تم العملية بنجاح",
            desc: "تم عملية الدفع المسبقة بشكل صحيح");
        Get.to(() => const DiagnosticHistory());
      } else {
        //   print(diagnosticPaymentModel?.data![0]);
        // print(diagnosticPaymentModel?.data![1]);
        //  Get.to(() => DiagnosticPayment());
        Alert.error("الرجاء إتمام عملية الدفع",
            desc:
            "عزيزي العميل الرجاء الضغط علي الباقة المدونه واتباع الخطوات اللازمة للاتمام العملية");
      }



   }
*/
}
