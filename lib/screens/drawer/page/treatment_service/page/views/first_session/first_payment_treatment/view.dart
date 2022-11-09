import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/views/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../../../../config/keys.dart';

import '../../../../../../../home/cubit/home_tabebar_cubit.dart';
import '../../../../../../../home/view.dart';
import '../../../../../../../widgets/alerts.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/customButton.dart';
import '../../../../../../../widgets/fast_widget.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/diagnostic_history/view.dart';
import '../../../../../diagnostic_service/page/views/diagnostic_payment/views/alert_message.dart';
import '../../pre-treatment_questionnaire/view.dart';
import 'cubit/first_payment_cubit.dart';

// ignore: must_be_immutable
class FirstPaymentTreatment extends StatelessWidget {
  const FirstPaymentTreatment({Key? key}) : super(key: key);

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
                  child: Column(
                    children: [
                      CustomTileContainer(
                          widthh: context.width / 2.5,
                          title: KeysConfig.payment,
                          context: context),


                      const AlertMessageToWait(),
                      PaymentCard(
                          price: state.firstPaymentModel.data!.treatmentSubscriptions![0].price!.toString()+"ريال ",
                          onTapPay: () {
                            navigateTo(
                                context,
                                const WebView(
                                  javascriptMode: JavascriptMode.unrestricted,
                                  initialUrl:
                                      "http://dev-sas.cpt-it.com/Sas/PaymentTreatment",
                                ));
                            print("object1");
                          },
                          description: state.firstPaymentModel.data!.treatmentSubscriptions![0].title!

                      ),
                      PaymentCard(
                          price: state.firstPaymentModel.data!.treatmentSubscriptions![1].price!.toString()+"ريال ",
                          onTapPay: () {
                            navigateTo(
                                context,
                                const WebView(
                                  javascriptMode: JavascriptMode.unrestricted,
                                  initialUrl:
                                      "http://dev-sas.cpt-it.com/Sas/PaymentTreatment",
                                ));

                            print("object2");
                          },
                          description: state.firstPaymentModel.data!.treatmentSubscriptions![1].title!),
                      PaymentCard(
                          price: state.firstPaymentModel.data!.treatmentSubscriptions![2].price!.toString()+" ريال",
                          onTapPay: () {
                            navigateTo(
                                context,
                                const WebView(
                                  javascriptMode: JavascriptMode.unrestricted,
                                  initialUrl:
                                      "http://dev-sas.cpt-it.com/Sas/PaymentTreatment",
                                ));
                            print("object3");
                          },
                          description: state.firstPaymentModel.data!.treatmentSubscriptions![2].title!),




                      state is! FirstPaymentLoading ? CustomButton(
                          onPressed: () {
                              cubit.getFirstPayment();
                            // if (state.firstPaymentModel.data!.subscriptionStages!.isEmpty) {
                            //   //   print(diagnosticPaymentModel?.data![0]);
                            //   //  print(diagnosticPaymentModel?.data!.contains(1)==true);
                            //     print("اللسته فااااااااااااااضية");
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
                            //    print("خلية يروح يدفع");
                            //
                            //   Alert.error("الرجاء إتمام عملية الدفع",
                            //       desc:
                            //       "عزيزي العميل الرجاء الضغط علي الباقة المدونه واتباع الخطوات اللازمة للاتمام العملية");
                            // }

                              BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(1);
                              Get.offAll(()=> const HomeTabScreen());

                          },
                          title: "متابعة"):const LoadingFadingCircleSmall()   ,
                      SizedBox(
                        height: context.height * 0.1,
                      )
                    ],
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
