import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/views/payment_card.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/success_page.dart';
import 'package:tal3thoom/screens/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../config/keys.dart';
import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/fast_widget.dart';
import '../../../../../view.dart';
import '../diagnostic_history/view.dart';

// ignore: must_be_immutable
class DiagnosticPayment extends StatelessWidget {
final _scaffoldKey = GlobalKey<ScaffoldState>();


  DiagnosticPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: () => _scaffoldKey.currentState!.openDrawer()),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          color: kHomeColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTileContainer(
                    widthh: width / 2.5,
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
                                "https://dev-sas.cpt-it.com/Sas/PaymentTreatment",
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
                                "https://dev-sas.cpt-it.com/Sas/PaymentTreatment",
                          ));
                      print("object3");
                    },
                    description: KeysConfig.DiagnosisTreatment),
                SmallButton(
                    onPressed: () {
                      navigateTo(
                          context,
                          SuccessView(
                            title1: "لقد تم عملية الدفع  بنجاح",
                            title2: "المرحلة الأولي من التشخيص",
                            onTap: () =>
                                navigateTo(context, const DiagnosticHistory()),
                          ));
                    },
                    title: "Skip"),

                SizedBox(height: height*0.1,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}