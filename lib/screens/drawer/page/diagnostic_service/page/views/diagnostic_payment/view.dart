import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/cubit/diagnostic_payment_cubit.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/views/alert_message.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/views/alert_to_pay.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/views/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../widgets/alerts.dart';
import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/customButton.dart';
import '../../../../../../widgets/fast_widget.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../cubit/data_access_permission_cubit.dart';
import '../../../../../view.dart';
import '../../../../treatment_service/page/views/first_session/first_stage_induction/view.dart';
import '../diagnostci_oases_test/view.dart';
import '../diagnostic_history/view.dart';
import '../diagnostic_ssi4/views/department_one/view.dart';
import '../diagnostic_ssrs_test/view.dart';
import '../resevation_diagnostic/view.dart';

// ignore: must_be_immutable
class DiagnosticPaymentScreen extends StatefulWidget {
  const DiagnosticPaymentScreen({Key? key}) : super(key: key);

  @override
  State<DiagnosticPaymentScreen> createState() =>
      _DiagnosticPaymentScreenState();
}

class _DiagnosticPaymentScreenState extends State<DiagnosticPaymentScreen> {
  var userId = Prefs.getString("userId");

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataAccessPermissionCubit>(context).getAccessPermission();
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: BlocConsumer<DiagnosticPaymentCubit, DiagnosticPaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<DiagnosticPaymentCubit>(context);

          if (state is DiagnosticPaymentLoading) {
            return const LoadingFadingCircle();
          }
          if (state is DiagnosticPaymentSuccess) {
            return SingleChildScrollView(
              child: Container(
                height: context.height,
                width: context.width,
                color: kHomeColor,
                child: RefreshIndicator(
                  onRefresh: () async {
                    cubit.getDiagnosticPayment();
                    BlocProvider.of<DataAccessPermissionCubit>(context)
                        .getAccessPermission();
                    return Future<void>.delayed(const Duration(seconds: 3));
                  },
                  backgroundColor: kPrimaryColor,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTileContainer(
                            widthh: context.width / 2.5,
                            title: "المتابعة",
                            context: context),
                        const AlertMessageToWait(),
                        PaymentCard2(
                            price: "الإنتقال الي المتصفح لمتابعة العملية",
                            onTapPay: () {
                              navigateTo(
                                  context,
                                  WebView(
                                    javascriptMode: JavascriptMode.unrestricted,
                                    initialUrl:
                                    "http://mcsc-saudi.com/Sas/PaymentDiagnosis/$userId",
                                  ));
                              print("object1");
                            },
                            description: "متابعة"),
                      /*  PaymentCard(
                            price: state.firstPaymentModel.data!
                                    .diagnosisSubscriptions![0].price!
                                    .toString() +
                                " ريال",
                            onTapPay: () {
                              navigateTo(
                                  context,
                                  WebView(
                                    javascriptMode: JavascriptMode.unrestricted,
                                    initialUrl:
                                        "http://mcsc-saudi.com/Sas/PaymentDiagnosis/$userId",
                                  ));
                              print("object1");
                            },
                            description: state.firstPaymentModel.data!
                                .diagnosisSubscriptions![0].title!),
                        PaymentCard(
                            price: state.firstPaymentModel.data!
                                    .diagnosisSubscriptions![1].price!
                                    .toString() +
                                " ريال",
                            onTapPay: () {
                              navigateTo(
                                  context,
                                  WebView(
                                    javascriptMode: JavascriptMode.unrestricted,
                                    initialUrl:
                                        "http://mcsc-saudi.com/Sas/PaymentDiagnosis/$userId",
                                  ));

                              print("object2");
                            },
                            description: state.firstPaymentModel.data!
                                .diagnosisSubscriptions![1].title!),
                        PaymentCard(
                            price: state.firstPaymentModel.data!
                                    .diagnosisSubscriptions![2].price!
                                    .toString() +
                                " ريال",
                            onTapPay: () {
                              navigateTo(
                                  context,
                                  WebView(
                                    javascriptMode: JavascriptMode.unrestricted,
                                    initialUrl:
                                        "http://mcsc-saudi.com/Sas/PaymentDiagnosis/$userId",
                                  ));
                              print("object3");
                            },
                            description: state.firstPaymentModel.data!
                                .diagnosisSubscriptions![2].title!),*/

                        SizedBox(height: context.height*0.05,),
                        const AlertMessageToPay(),
                        state is! DiagnosticPaymentLoading
                            ? BlocConsumer<DataAccessPermissionCubit,
                                DataAccessPermissionState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  final checkPay = BlocProvider.of<
                                      DataAccessPermissionCubit>(context);

                                  if (state is DataAccessPermissionLoading) {
                                    return const LoadingFadingCircle();
                                  }
                                  if (state is DataAccessPermissionSuccess) {
                                    return CustomButton(
                                        onPressed: () {
                                          cubit.getDiagnosticPayment();
                                          // if (state.firstPaymentModel.data!.subscriptionStages!.isEmpty) {
                                          //   //   print(diagnosticPaymentModel?.data![0]);
                                          //   //  print(diagnosticPaymentModel?.data!.contains(1)==true);
                                          //   print("اللسته فااااااااااااااضية");
                                          //
                                          //   Alert.error("الرجاء إتمام عملية الدفع",
                                          //       desc:
                                          //       "عزيزي العميل الرجاء الضغط علي الباقة المدونه واتباع الخطوات اللازمة للاتمام العملية");
                                          //   Get.to(() => const FirstPaymentTreatment());
                                          // } else if ((state.firstPaymentModel.data!.subscriptionStages!.contains(2)) == true ||
                                          //     (state.firstPaymentModel.data!.subscriptionStages!.contains(4)) == true) {
                                          //   print("دفع الجستان 2 و 4 ");
                                          //   Alert.success("تم العملية بنجاح",
                                          //       desc: "تم عملية الدفع المسبقة بشكل صحيح");
                                          //   Get.off(() => const PretreatmentQuestionnaire());
                                          // } else if (state.firstPaymentModel.data!.subscriptionStages!.contains(1) == true) {
                                          //   print("دف الجلسة التشخصية فقط ");
                                          //   Alert.success("تم العملية بنجاح",
                                          //       desc: "تم عملية الدفع المسبقة بشكل صحيح");
                                          //   Get.off(() => const DiagnosticHistory());
                                          // } else if (state.firstPaymentModel.data!.subscriptionStages!.contains(1) == true &&
                                          //     state.firstPaymentModel.data!.subscriptionStages!.contains(2) == true &&
                                          //     state.firstPaymentModel.data!.subscriptionStages!.contains(4) == true) {
                                          //   print("دفع كل الباقات يباشا");
                                          //
                                          //   Alert.success("تم العملية بنجاح",
                                          //       desc: "تم عملية الدفع المسبقة بشكل صحيح");
                                          //   Get.to(() => const DiagnosticHistory());
                                          // } else {
                                          //   print("خلية يروح يدفع");
                                          //
                                          //   Alert.error("الرجاء إتمام عملية الدفع",
                                          //       desc:
                                          //       "عزيزي العميل الرجاء الضغط علي الباقة المدونه واتباع الخطوات اللازمة للاتمام العملية");
                                          // }

                                          if (state.accessPermissionModel.data!
                                                  .stagesDiagnosis!.payment ==
                                              false) {
                                            Alert.error(
                                                "الرجاء إتمام العملية من الموقع",
                                                desc:
                                                "عزيزي العميل الرجاء الضغط علي زر (إلي المتصفح) المدون واتباع الخطوات اللازمة للاتمام العملية");
                                                                                         }

                                          if (state
                                                      .accessPermissionModel
                                                      .data!
                                                      .stagesDiagnosis!
                                                      .payment ==
                                                  true &&
                                              state
                                                      .accessPermissionModel
                                                      .data!
                                                      .stagesDiagnosis!
                                                      .caseHistory ==
                                                  false) {
                                            Get.offAll(() =>
                                                const DiagnosticHistory());
                                          }
                                          if (state
                                                      .accessPermissionModel
                                                      .data!
                                                      .stagesDiagnosis!
                                                      .caseHistory ==
                                                  true &&
                                              state.accessPermissionModel.data!
                                                      .stagesDiagnosis!.oases ==
                                                  false) {
                                            Get.offAll(() =>
                                                const DiagnosticOasesTest());
                                          }
                                          if (state.accessPermissionModel.data!
                                                      .stagesDiagnosis!.oases ==
                                                  true &&
                                              state.accessPermissionModel.data!
                                                      .stagesDiagnosis!.ssrs ==
                                                  false) {
                                            Get.offAll(() =>
                                                const SSRSDiagnosticsScreen());
                                          }
                                          if (state.accessPermissionModel.data!
                                                      .stagesDiagnosis!.ssrs ==
                                                  true &&
                                              state.accessPermissionModel.data!
                                                      .stagesDiagnosis!.ssi4 ==
                                                  false) {
                                            Get.offAll(
                                                () => const DiagnosticSSI4());
                                          }
                                          if (state.accessPermissionModel.data!
                                                      .stagesDiagnosis!.ssi4 ==
                                                  true &&
                                              state
                                                      .accessPermissionModel
                                                      .data!
                                                      .stagesDiagnosis!
                                                      .booking ==
                                                  false) {
                                            Get.offAll(
                                                () => ReservationDiagnostic());
                                          }
                                          if (state
                                                      .accessPermissionModel
                                                      .data!
                                                      .stagesDiagnosis!
                                                      .booking ==
                                                  true &&
                                              state
                                                      .accessPermissionModel
                                                      .data!
                                                      .stagesDiagnosis!
                                                      .closeBooking ==
                                                  true) {
                                            Get.offAll(() =>
                                                const FirstTreatmentInduction());
                                          }
                                        },
                                        title: "متابعة العملية");
                                  }
                                  if (state is DataAccessPermissionError) {
                                    return Text(state.msg);
                                  }

                                  return const SizedBox();
                                },
                              )
                            : const LoadingFadingCircleSmall(),
                        SizedBox(
                          height: context.height * 0.2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          if (state is DiagnosticPaymentError) {
            return Text(state.msg);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
