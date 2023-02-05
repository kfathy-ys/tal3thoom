import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/views/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../../../../config/keys.dart';

import '../../../../../../../widgets/alerts.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/fast_widget.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../../widgets/mediaButton.dart';
import '../../../../../../cubit/data_access_permission_cubit.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/diagnostic_payment/views/alert_message.dart';
import '../../../../../diagnostic_service/page/views/diagnostic_payment/views/alert_to_pay.dart';
import '../../pre-treatment_questionnaire/view.dart';
import '../../second_session/game_over/view.dart';
import '../../second_session/second_cognitive_session/view.dart';
import '../../second_session/second_stage_oases_test/view.dart';
import '../../second_session/second_stage_resevation/view.dart';
import '../../second_session/second_stage_ssrs_test/view.dart';
import '../../second_session/second_stage_treatment_ssi4/views/department_one/view.dart';
import '../first_cognitive_session/view.dart';
import '../first_stage_oases_test/view.dart';
import '../first_stage_resevation/view.dart';
import '../first_stage_ssrs_test/view.dart';
import '../first_stage_treatment_ssi4/views/department_one/view.dart';
import 'cubit/first_payment_cubit.dart';

// ignore: must_be_immutable
class FirstPaymentTreatment extends StatelessWidget {
  FirstPaymentTreatment({Key? key}) : super(key: key);
  var userId = Prefs.getString("userId");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: BlocConsumer<FirstPaymentCubit, FirstPaymentState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<FirstPaymentCubit>(context);

          if (state is FirstPaymentLoading) {
            return const LoadingFadingCircle();
          }
          if (state is FirstPaymentSuccess) {
            return SingleChildScrollView(
              child: Container(
                height: context.height,
                width: context.width,
                color: kHomeColor,
                child: SingleChildScrollView(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      cubit.getFirstPayment();
                      BlocProvider.of<DataAccessPermissionCubit>(context)
                          .getAccessPermission();
                      return Future<void>.delayed(const Duration(seconds: 3));
                    },
                    backgroundColor: kPrimaryColor,
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomTileContainer(
                            widthh: context.width / 2.5,
                            title: "العروض",
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
                            description: "متابعة العروض"),
                        SizedBox(height: context.height*0.15,),
                        // PaymentCard(
                        //     price: state.firstPaymentModel.data!
                        //             .treatmentSubscriptions![0].price!
                        //             .toString() +
                        //         "ريال ",
                        //     onTapPay: () {
                        //       navigateTo(
                        //           context,
                        //           WebView(
                        //             javascriptMode: JavascriptMode.unrestricted,
                        //             initialUrl:
                        //                 "http://mcsc-saudi.com/Sas/PaymentTreatment/$userId",
                        //           ));
                        //       print("object1");
                        //     },
                        //     description: state.firstPaymentModel.data!
                        //         .treatmentSubscriptions![0].title!),
                        // PaymentCard(
                        //     price: state.firstPaymentModel.data!
                        //             .treatmentSubscriptions![1].price!
                        //             .toString() +
                        //         "ريال ",
                        //     onTapPay: () {
                        //       navigateTo(
                        //           context,
                        //           WebView(
                        //             javascriptMode: JavascriptMode.unrestricted,
                        //             initialUrl:
                        //                 "http://mcsc-saudi.com/Sas/PaymentTreatment/$userId",
                        //           ));
                        //
                        //       print("object2");
                        //     },
                        //     description: state.firstPaymentModel.data!
                        //         .treatmentSubscriptions![1].title!),
                        // PaymentCard(
                        //     price: state.firstPaymentModel.data!
                        //             .treatmentSubscriptions![2].price!
                        //             .toString() +
                        //         " ريال",
                        //     onTapPay: () {
                        //       navigateTo(
                        //           context,
                        //           WebView(
                        //             javascriptMode: JavascriptMode.unrestricted,
                        //             initialUrl:
                        //                 "http://mcsc-saudi.com/Sas/PaymentTreatment/$userId",
                        //           ));
                        //       print("object3");
                        //     },
                        //     description: state.firstPaymentModel.data!
                        //         .treatmentSubscriptions![2].title!),
                        const AlertMessageToPay(),
                        state is! FirstPaymentLoading
                            ? BlocConsumer<DataAccessPermissionCubit,
                                DataAccessPermissionState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  if (state is DataAccessPermissionLoading) {
                                    return const LoadingFadingCircle();
                                  }
                                  if (state is DataAccessPermissionSuccess) {
                                    return MediaButton(
                                      onPressed: () {
                                        if (state
                                                .accessPermissionModel
                                                .data!
                                                .stagesTreatment!
                                                .paymentTreatmentOne ==
                                            false) {
                                          Alert.error(
                                              "الرجاء إتمام العملية من الموقع",
                                              desc:
                                                  "عزيزي العميل الرجاء الضغط علي زر (إلي المتصفح) المدون واتباع الخطوات اللازمة للاتمام العملية");
                                        }

                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatment!
                                                    .paymentTreatmentOne ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatment!
                                                    .preTreatment ==
                                                false) {
                                          Get.offAll(() =>
                                              const PretreatmentQuestionnaire());
                                        }
                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatment!
                                                    .preTreatment ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .sessions ==
                                                false) {
                                          Get.offAll(() =>
                                              const FirstTreatmentSession());
                                        }
                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .sessions ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .oases ==
                                                false) {
                                          Get.offAll(() =>
                                              const FirstStageOasesTest());
                                        }
                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .oases ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .ssrs ==
                                                false) {
                                          Get.offAll(() =>
                                              const FirstStageSSRSTreatmentScreen());
                                        }
                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .ssrs ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .ssi4 ==
                                                false) {
                                          Get.offAll(
                                              () => const TreatmentSSI4());
                                        }
                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .ssi4 ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .booking ==
                                                false) {
                                          Get.offAll(() =>
                                              FirstStageTreatmentReservation());
                                        }

                                        ///////////////////////////////////////

                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .closeBooking ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatment!
                                                    .paymentTreatmentTwo ==
                                                false) {
                                          Get.offAll(
                                              () => FirstPaymentTreatment());
                                        }

                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatment!
                                                    .paymentTreatmentTwo ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentFirst!
                                                    .closeBooking ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .sessions ==
                                                false) {
                                          Get.offAll(() =>
                                              const SecondTreatmentSession());
                                        }
                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .sessions ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .oases ==
                                                false) {
                                          Get.offAll(() =>
                                              const SecondStageOasesTest());
                                        }
                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .oases ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .ssrs ==
                                                false) {
                                          Get.offAll(() =>
                                              const SecondStageSSRSTreatmentScreen());
                                        }
                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .ssrs ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .ssi4 ==
                                                false) {
                                          Get.offAll(() =>
                                              const SecondTreatmentSSI4());
                                        }
                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .ssi4 ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .booking ==
                                                false) {
                                          Get.offAll(() =>
                                              SecondStageTreatmentReservation());
                                        }
                                        if (state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .booking ==
                                                true &&
                                            state
                                                    .accessPermissionModel
                                                    .data!
                                                    .stagesTreatmentSecond!
                                                    .closeBooking ==
                                                true) {
                                          Get.offAll(() => const GameOver());
                                        }
                                      },
                                      title: KeysConfig.next,
                                    );
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
          if (state is FirstPaymentError) {
            return Text(state.msg);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
