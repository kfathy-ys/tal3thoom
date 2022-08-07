import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:flutter/material.dart';

import '../../../widgets/appBar.dart';
import '../../../widgets/constants.dart';
import '../../view.dart';


// ignore: must_be_immutable
class MedicalReports extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

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
        child: SizedBox(
          height: height,
          width: width ,

          child: Column(
            children: [
              CustomTileContainer(
                  widthh: width * 0.5,
                  title: "التقارير الطبية",
                  context: context),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 8,
                 physics: const BouncingScrollPhysics(),
                 itemBuilder: (context ,index){
                   return Container(
                     margin: const EdgeInsets.symmetric(vertical: 16),
                     padding: const EdgeInsets.symmetric(horizontal: 14),
                     height: height*0.3,
                     width: width*0.8,
                     decoration: BoxDecoration(

                         borderRadius: BorderRadius.circular(8),
                         border: Border.all(color: kTextFieldColor)
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             customText10(title: "أسم التقارير", color: kPrimaryColor),
                             customText10(title: "إستشارة طبية", color: kBlackText)
                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             customText10(title: "أسم المتخصص", color: kPrimaryColor),
                             customText10(title: "د.محمد زايد", color: kBlackText)
                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             customText10(title: "تاريخ الإصدار", color: kPrimaryColor),
                             customText10(title: "2022-10-16", color: kBlackText)
                           ],
                         ),

                         CustomButton(title: "عرض التقرير",color: kPrimaryColor,onPressed: (){},)
                       ],
                     ),
                   );
                 },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(
    height: height * 0.05,
  );
}
