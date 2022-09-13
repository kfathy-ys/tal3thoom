import 'package:tal3thoom/screens/drawer/page/medical_reports/views/card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';

import '../../../widgets/appBar.dart';
import '../../../widgets/constants.dart';
import '../../view.dart';
import 'medical_report_details/view.dart';

// ignore: must_be_immutable
class MedicalReports extends StatelessWidget {
  const MedicalReports({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            children: [
              CustomTileContainer(
                  widthh: context.width * 0.5,
                  title: "التقارير الطبية",
                  context: context),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 8,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CardItems(
                        onPressed: () {
                          navigateTo(context, const MedicalReportsDetails());
                        },
                        subTitleReportName: "إستشارة طبية",
                        subTitleSpecialistName: "د.محمد زايد",
                        subTitleDate: "2022-10-16");
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
