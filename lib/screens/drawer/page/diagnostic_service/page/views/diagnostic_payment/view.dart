import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/cubit/diagnostic_payment_cubit.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/views/payment_card.dart';
import 'package:tal3thoom/screens/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../config/keys.dart';
import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/fast_widget.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../view.dart';

// ignore: must_be_immutable
class DiagnosticPayment extends StatelessWidget {
  const DiagnosticPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
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
                                      "http://dev-sas.cpt-it.com/Sas/PaymentDiagnosis",
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
                                      "http://dev-sas.cpt-it.com/Sas/PaymentDiagnosis",
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
                                      "http://dev-sas.cpt-it.com/Sas/PaymentDiagnosis",
                                ));
                            print("object3");
                          },
                          description: KeysConfig.DiagnosisTreatment),
                      SmallButton(
                          onPressed: () {
                            cubit.checkDiagnosticPayment();
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
          if (state is DiagnosticPaymentError) {
            return Text(state.msg);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
