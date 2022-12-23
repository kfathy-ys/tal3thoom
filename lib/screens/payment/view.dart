import 'package:tal3thoom/screens/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../drawer/page/diagnostic_service/page/views/diagnostic_history/view.dart';
import '../drawer/page/diagnostic_service/page/views/success_page.dart';
import '../drawer/view.dart';
import '../widgets/appBar.dart';
import '../widgets/constants.dart';
import '../../../../../../config/keys.dart';
import '../widgets/fast_widget.dart';

// ignore: must_be_immutable
class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

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
      body: Container(
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
              paymentCard(context.width, context.height,
                  price: KeysConfig.fifty, onTapPay: () {
                navigateTo(
                    context,
                    const WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: "http://mcsc-saudi.com/Sas/PaymentTreatment",
                    ));
              }, description: KeysConfig.diagnosis),
              paymentCard(context.width, context.height,
                  price: KeysConfig.hundred, onTapPay: () {
                navigateTo(
                    context,
                    const WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: "http://mcsc-saudi.com/Sas/PaymentTreatment",
                    ));
              }, description: KeysConfig.twoSession),
              paymentCard(context.width, context.height,
                  price: KeysConfig.fifty, onTapPay: () {
                navigateTo(
                    context,
                    const WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: "http://mcsc-saudi.com/Sas/PaymentTreatment",
                    ));
              }, description: KeysConfig.DiagnosisTreatment),
              SmallButton(
                title: "Skip",
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentCard(
    double width,
    double height, {
    required String description,
    required VoidCallback onTapPay,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18),
      width: width * 0.6,
      height: height * 0.35,
      decoration: BoxDecoration(
        color: kHomeColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: kRoundBorderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomCurvedContainer(
            title: description,
          ),
          customText5(title: price, color: kBlackText),
          SmallButton(
            onPressed: onTapPay,
            title: KeysConfig.payment,
          )
        ],
      ),
    );
  }
}
