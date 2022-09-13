import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_induction/view.dart';
import 'package:tal3thoom/screens/drawer/page/medical_reports/view.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../drawer/page/advisors_service/views/advisor_induction/view.dart';
import '../../../../drawer/page/treatment_service/page/views/second_session/second_stage_induction/view.dart';

// ignore: must_be_immutable
class MyHomeScreen extends StatelessWidget {
  final String? userId;

  MyHomeScreen({Key? key, this.userId}) : super(key: key);

  final token = Prefs.getString('token');

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Card(
      //color: Colors.pinkAccent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/main_page.png", fit: BoxFit.fill),
          Positioned(
              top: 300,
              right: 80,
              child: SizedBox(
                  //color: Colors.pinkAccent,
                  height: context.height * 0.12,
                  width: context.width * 0.2,
                  child: InkWell(
                      onTap: () {
                        print("object1");
                        navigateTo(context, const InductionDiagnostic());
                      },
                      child: customText7(
                          title: "title", color: Colors.transparent)))),
          Positioned(
              top: 300,
              right: 200,
              child: SizedBox(
                  //color: Colors.pinkAccent,
                  height: context.height * 0.12,
                  width: context.width * 0.2,
                  child: InkWell(
                      onTap: () {
                        print("object2");
                        navigateTo(context, const TreatmentServiceInduction());
                      },
                      child: customText7(
                          title: "title", color: Colors.transparent)))),
          Positioned(
              top: 400,
              right: 100,
              child: SizedBox(
                  // color: Colors.pinkAccent,
                  height: context.height * 0.12,
                  width: context.width * 0.43,
                  child: InkWell(
                      onTap: () {
                        print("object3");
                        navigateTo(context, const MedicalReports());
                      },
                      child: customText7(
                          title: "title", color: Colors.transparent)))),
          Positioned(
              top: 500,
              right: 100,
              child: SizedBox(
                  //color: Colors.pinkAccent,
                  height: context.height * 0.12,
                  width: context.width * 0.43,
                  child: InkWell(
                      onTap: () {
                        print("object4");
                        navigateTo(context, const AdviserInduction());
                      },
                      child: customText7(
                          title: "title", color: Colors.transparent)))),
        ],
      ),
    );
  }

  Widget cardServices(double height, double width,
      {required Color color,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: height * 0.1,
        width: width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText2(title: title, color: kHomeColor),
            // Image.asset(image!,),
            const Icon(Icons.date_range)
          ],
        )),
      ),
    );
  }
}
