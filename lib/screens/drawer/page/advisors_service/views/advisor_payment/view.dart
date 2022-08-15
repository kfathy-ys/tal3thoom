import 'package:tal3thoom/screens/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../config/keys.dart';

import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/fast_widget.dart';
import '../../../../view.dart';
import '../../../diagnostic_service/page/views/diagnostic_payment/views/payment_card.dart';
import '../../../diagnostic_service/page/views/success_page.dart';

// ignore: must_be_immutable
class PaymentAdvisor extends StatelessWidget {
  PaymentAdvisor({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
      body: Container(
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
                title: "Skip",
                onPressed: () {
                  //    BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(2);

                  navigateTo(
                      context,
                      const SuccessView(
                        title1: "لقد تم عملية الدفع  بنجاح",
                        title2: "الإنتقال إلي جدول الحجوزات",
                      ));
                },
              ),
              SizedBox(
                height: height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
