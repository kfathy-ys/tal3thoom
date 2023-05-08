import 'package:animate_do/animate_do.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TerminationConditions extends StatelessWidget {
  const TerminationConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.04,
            ),
            FadeInUpBig(
                child: Image.asset("assets/images/personal information.png")),
            CustomButton(
              color: kPrimaryColor,
              title: "تخطي",
              onPressed: () {
                Get.back();
              },
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
