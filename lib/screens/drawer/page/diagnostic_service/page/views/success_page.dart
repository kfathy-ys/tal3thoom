import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../view.dart';

// ignore: must_be_immutable
class SuccessView extends StatelessWidget {
  final String title1;
  final String title2;
  final VoidCallback onTap;
  var scaffoldKey = GlobalKey<ScaffoldState>();

   SuccessView({Key? key, required this.title1, required this.title2, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kHomeColor,
      drawer: MenueItems(),
      appBar: DynamicAppbar(
          context: context,
          press: () => scaffoldKey.currentState!.openDrawer()),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          color: kHomeColor,
          child: Column(children: [
            SizedBox(height: height*0.3,),
            customText7(
                title: title1,
                //"لقد تم إنتهاء إختبار التاريخ المرضي بنجاح",
                color: kBlackText),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: kSkyLightColor,
              width: width * 0.85,
              height: height * 0.28,
              child: Center(
                child: Image.asset("assets/images/success.png"),
              ),
            ),

            CustomButton(color: kPrimaryColor,onPressed:onTap,


            //     (){
            //
            //   navigateAndFinish(context, DiagnosticOasesTest());
            // }



            title: title2
            //"إنتقال إلي إختبار Oases",
            ),
          ]),
        ),
      ),
    );
  }
}
