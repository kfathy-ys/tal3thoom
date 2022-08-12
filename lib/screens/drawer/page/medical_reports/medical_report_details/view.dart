import 'package:tal3thoom/config/keys.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/appBar.dart';
import '../../../../widgets/constants.dart';
import '../../../view.dart';

// ignore: must_be_immutable
class MedicalReportsDetails extends StatelessWidget {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  MedicalReportsDetails({Key? key}) : super(key: key);

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
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: kSkyButton.withOpacity(0.05),
              border: Border.all(color: kBlackText),
              borderRadius: BorderRadius.circular(8),
            ),
            height: height,
            width: width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                headSubHead(width, height,
                    head1: "أسم المريض  ",
                    head2: "Client Name",
                    sunHead: "Mohamed Rashad"),
                headSubHead(width, height,
                    head1: "رقم الهوية  ",
                    head2: "ID No",
                    sunHead: "123456789"),
                headSubHead(width, height,
                    head1: "الجنس  ", head2: "Gender", sunHead: "Male"),
                headSubHead(width, height,
                    head1: "الجنسية  ",
                    head2: "Nationality",
                    sunHead: "Egyptian"),
                headSubHead(width, height,
                    head1: "تاريخ الميلاد  ",
                    head2: "Date of birth",
                    sunHead: "10-8-1988"),
                headSubHead(width, height,
                    head1: "المهنة  ", head2: "Occupation	", sunHead: ""),
                headSubHead(width, height,
                    head1: "جهة العمل  ", head2: "Work Place", sunHead: ""),
                headSubHead(width, height,
                    head1: "تاريخ التسجيل ",
                    head2: "Date of enrolment",
                    sunHead: "12-10-2022"),
                headSubHead(width, height,
                    head1: "تاريخ الخروج ",
                    head2: "Discharge date",
                    sunHead: "31-10-2022"),
                descriptionResult(width, height,
                    title1: " Area of",
                    title2: "Concern",
                    subTitle: KeysConfig.kConcern),
                descriptionResult(width, height,
                    title1: " Background ",
                    title2: "Information",
                    subTitle: KeysConfig.kBackgroundInformation),
                descriptionResult(width, height,
                    title1: " Fluency ",
                    title2: "Testing",
                    subTitle: KeysConfig.kFluencyTesting),
                descriptionResult(width, height,
                    title1: " Overall Assessment",
                    title2: "(OASES)",
                    subTitle: KeysConfig.kOASES),
                descriptionResult(width, height,
                    title1: " Overall Assessment",
                    title2: "(SSRS)",
                    subTitle: KeysConfig.kSSRS),
                SizedBox(
                  height: height * 0.02,
                ),
                buildTable(
                    textColor: kHomeColor,
                    height,
                    width,
                    color: kPrimaryColor,
                    title3: "Section SSI-4",
                    title2: "Findings / Observations",
                    title1: "Total Score"),
                buildTable(
                    textColor: kTextFieldColor,
                    height,
                    width,
                    color: kAppBarColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                buildTable(
                    textColor: kTextFieldColor,
                    height,
                    width,
                    color: kHomeColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                buildTable(
                    textColor: kTextFieldColor,
                    height,
                    width,
                    color: kAppBarColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                buildTable(
                    textColor: kTextFieldColor,
                    height,
                    width,
                    color: kHomeColor,
                    title1: "مثال1",
                    title2: "مثال1",
                    title3: "مثال1"),
                buildTable(
                    textColor: kTextFieldColor,
                    height,
                    width,
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
                buildFourTable(
                  textColor: kHomeColor,
                  height,
                  width,
                  color: kPrimaryColor,
                  title1: "Impact score",
                  title2: "Impact rating",
                  title3: "Items answered",
                  title4: "Raw score",
                  title5: "Scale",
                ),  buildFourTable(
                  textColor: kTextFieldColor,
                  height,
                  width,
                  color: kAppBarColor,
                  title1: "Impact score",
                  title2: "Impact rating",
                  title3: "Items answered",
                  title4: "Raw score",
                  title5: "Scale",
                ),  buildFourTable(
                  textColor: kTextFieldColor,
                  height,
                  width,
                  color: kHomeColor,
                  title1: "Impact score",
                  title2: "Impact rating",
                  title3: "Items answered",
                  title4: "Raw score",
                  title5: "Scale",
                ),  buildFourTable(
                  textColor: kTextFieldColor,
                  height,
                  width,
                  color: kAppBarColor,
                  title1: "Impact score",
                  title2: "Impact rating",
                  title3: "Items answered",
                  title4: "Raw score",
                  title5: "Scale",
                ),  buildFourTable(
                  textColor: kTextFieldColor,
                  height,
                  width,
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

                descriptionResult(width, height,
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

  Widget buildTable(double height, double width,
      {required Color textColor,
      required Color color,
      required String title1,
      required String title2,
      required String title3}) {
    return Container(
      height: height * 0.059,
      width: width * 0.8,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: kAppBarColor),
        //  borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisSize: MainAxisSize.min,
        children: [
          customText3(title: title1, color: textColor),
          customText3(title: title2, color: textColor),
          customText3(title: title3, color: textColor)
        ],
      ),
    );
  }

  Widget buildFourTable(
    double height,
    double width, {
    required Color textColor,
    required Color color,
    required String title1,
    required String title2,
    required String title3,
    required String title4,
    required String title5,
  }) {
    return Container(
      height: height * 0.059,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: kAppBarColor),
        //  borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //ainAxisSize: MainAxisSize.max,
        children: [
          custom12Text(title: title1, color: textColor),
          custom12Text(title: title2, color: textColor),
          custom12Text(title: title3, color: textColor),
          custom12Text(title: title4, color: textColor),
          custom12Text(title: title5, color: textColor)
        ],
      ),
    );
  }

  Widget descriptionResult(
    double width,
    double height, {
    required String title1,
    required String title2,
    required String subTitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            //color: Colors.amber,
            width: width,
            height: height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customText4(title: title2, color: kPrimaryColor),
                customText4(title: title1, color: kTextFieldColor),
              ],
            ),
          ),
          customText7(title: subTitle, color: kBlackText)
        ],
      ),
    );
  }

  Widget headSubHead(
    double width,
    double height, {
    required String head1,
    required String head2,
    required String sunHead,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        //mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            // color: Colors.amber,
            width: width * 0.55,
            height: height * 0.05,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                customText10(title: head1, color: kPrimaryColor),
                customText10(title: head2, color: kTextFieldColor)
              ],
            ),
          ),
          customText10(title: sunHead, color: kBlackText)
        ],
      ),
    );
  }
}
