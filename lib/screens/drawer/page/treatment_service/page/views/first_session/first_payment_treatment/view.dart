import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/views/payment_card.dart';
import 'package:tal3thoom/screens/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../../../../config/keys.dart';

import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/fast_widget.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/success_page.dart';
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
                      PaymentCard(
                          price: KeysConfig.fifty,
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
                          description: KeysConfig.diagnosis),
                      PaymentCard(
                          price: KeysConfig.hundred,
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
                          description: KeysConfig.twoSession),
                      PaymentCard(
                          price: KeysConfig.fifty,
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
                          description: KeysConfig.DiagnosisTreatment),
                      SmallButton(
                          onPressed: () {
                            cubit.checkFirstPayment();
                            // navigateTo(
                            //     context,
                            //     SuccessView(
                            //       title1: "لقد تم عملية الدفع  بنجاح",
                            //       title2: "المرحلة الأولي من التشخيص",
                            //       onTap: () {
                            //         cubit.checkDiagnosticPayment();
                            //        // navigateTo(context, const DiagnosticHistory());
                            //       },
                            //     ),
                            //
                            // );
                          },
                          title: "متابعة"),
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
