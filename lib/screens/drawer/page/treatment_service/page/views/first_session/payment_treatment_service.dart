import 'package:tal3thoom/screens/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:queen/core/helpers/url_luncher.dart';
import '../../../../../../../config/keys.dart';

import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/fast_widget.dart';
import '../../../../../view.dart';
import '../../../../diagnostic_service/page/views/success_page.dart';
import '../pre-treatment_questionnaire/view.dart';


// ignore: must_be_immutable
class PaymentTreatment extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  PaymentTreatment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: () => scaffoldKey.currentState!.openDrawer()),
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
                    title: KeysConfig.payment ,
                    context: context),
                paymentCard(width, height, context,
                    price: KeysConfig.fifty , onTapPay: () {

                      String web = "https://dev-sas.cpt-it.com/Sas/PaymentTreatment";
                      Launch.url(web);
                      print("object1");
                    }, description: KeysConfig.diagnosis ),
                paymentCard(width, height, context,
                    price: KeysConfig.hundred , onTapPay: () {
                      String web = "https://dev-sas.cpt-it.com/Sas/PaymentTreatment";
                      Launch.url(web);
                      print("object2");
                    }, description: KeysConfig.twoSession ),
                paymentCard(width, height, context,
                    price: KeysConfig.fifty , onTapPay: () {
                      String web = "https://dev-sas.cpt-it.com/Sas/PaymentTreatment";
                      Launch.url(web);
                      print("object3");
                    }, description: KeysConfig.DiagnosisTreatment ),

            SmallButton(
              title: "Skip",
               color: kPrimaryColor,

              onPressed: (){

              navigateTo(context, SuccessView(title1: "لقد تم عملية الدفع  بنجاح",title2: "الأنتقال إلي الأستبيان ما قبل العلاج",
                onTap: ()=>navigateTo(context, const PretreatmentQuestionnaire()),));
            },),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentCard(
      double width,
      double height,
      BuildContext context, {
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
          CustomCurvedContainer(title: description, context: context),
          customText5(title: price, color: kBlackText),
          SmallButton(
            onPressed: onTapPay,
            title: KeysConfig.payment ,
          )
        ],
      ),
    );
  }
}
