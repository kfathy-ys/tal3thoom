import 'package:tal3thoom/config/keys.dart';
import 'package:flutter/material.dart';
import 'package:tal3thoom/screens/drawer/page/medical_reports/medical_report_details/views/description_results/view.dart';

import '../../../../widgets/appBar.dart';
import '../../../../widgets/constants.dart';
import '../../../view.dart';
import 'views/four_tables/view.dart';
import 'views/head_subtitle/view.dart';
import 'views/three_tables/views.dart';

// ignore: must_be_immutable
class MedicalReportsDetails extends StatelessWidget {

  const MedicalReportsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: kSkyButton.withOpacity(0.05),
            border: Border.all(color: kBlackText),
            borderRadius: BorderRadius.circular(8),
          ),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
            //physics: const BouncingScrollPhysics(),
              children: [
                const HeadSubHead(
                    head1: "أسم المريض  ",
                    head2: "Client Name",
                    sunHead: "Mohamed Rashad"),
                const HeadSubHead(
                    head1: "رقم الهوية  ",
                    head2: "ID No",
                    sunHead: "123456789"),
                const HeadSubHead(
                    head1: "الجنس  ", head2: "Gender", sunHead: "Male"),
                const HeadSubHead(
                    head1: "الجنسية  ",
                    head2: "Nationality",
                    sunHead: "Egyptian"),
                const HeadSubHead(
                    head1: "تاريخ الميلاد  ",
                    head2: "Date of birth",
                    sunHead: "10-8-1988"),
                const HeadSubHead(
                    head1: "المهنة  ", head2: "Occupation	", sunHead: ""),
                const HeadSubHead(
                    head1: "جهة العمل  ", head2: "Work Place", sunHead: ""),
                const HeadSubHead(
                    head1: "تاريخ التسجيل ",
                    head2: "Date of enrolment",
                    sunHead: "12-10-2022"),
                const HeadSubHead(
                    head1: "تاريخ الخروج ",
                    head2: "Discharge date",
                    sunHead: "31-10-2022"),
                const DescriptionResult(
                    title1: " Area of",
                    title2: "Concern",
                    subTitle: KeysConfig.kConcern),
                const DescriptionResult(
                    title1: " Background ",
                    title2: "Information",
                    subTitle: KeysConfig.kBackgroundInformation),
                const DescriptionResult(
                    title1: " Fluency ",
                    title2: "Testing",
                    subTitle: KeysConfig.kFluencyTesting),
                const DescriptionResult(
                    title1: " Overall Assessment",
                    title2: "(OASES)",
                    subTitle: KeysConfig.kOASES),
                const DescriptionResult(
                    title1: " Overall Assessment",
                    title2: "(SSRS)",
                    subTitle: KeysConfig.kSSRS),
                SizedBox(
                  height: height * 0.02,
                ),
                const Tables(
                    textColor: kHomeColor,
                    color: kPrimaryColor,
                    title3: "Section SSI-4",
                    title2: "Findings / Observations",
                    title1: "Total Score"),
                const Tables(
                    textColor: kTextFieldColor,
                    color: kAppBarColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                const Tables(
                    textColor: kTextFieldColor,
                    color: kHomeColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                const Tables(
                    textColor: kTextFieldColor,
                    color: kAppBarColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                const Tables(
                    textColor: kTextFieldColor,
                    color: kHomeColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                const Tables(
                    textColor: kTextFieldColor,
                    color: kAppBarColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child:
                      customText7(title: KeysConfig.kScore, color: kBlackText),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const FourTables(
                  textColor: kHomeColor,
                  color: kPrimaryColor,
                  title1: "Impact score",
                  title2: "Impact rating",
                  title3: "Items answered",
                  title4: "Raw score",
                  title5: "Scale",
                ),
                const FourTables(
                  textColor: kTextFieldColor,
                  color: kAppBarColor,
                  title1: "Impact score",
                  title2: "Impact rating",
                  title3: "Items answered",
                  title4: "Raw score",
                  title5: "Scale",
                ),
                const FourTables(
                  textColor: kTextFieldColor,
                  color: kHomeColor,
                  title1: "Impact score",
                  title2: "Impact rating",
                  title3: "Items answered",
                  title4: "Raw score",
                  title5: "Scale",
                ),
                const FourTables(
                  textColor: kTextFieldColor,
                  color: kAppBarColor,
                  title1: "Impact score",
                  title2: "Impact rating",
                  title3: "Items answered",
                  title4: "Raw score",
                  title5: "Scale",
                ),
                const FourTables(
                  textColor: kTextFieldColor,
                  color: kHomeColor,
                  title1: "Impact score",
                  title2: "Impact rating",
                  title3: "Items answered",
                  title4: "Raw score",
                  title5: "Scale",
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                const DescriptionResult(
                    title1: "",
                    title2: "Recommendations",
                    subTitle: KeysConfig.kRecommendations),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
