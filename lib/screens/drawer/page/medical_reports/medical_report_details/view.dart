import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/config/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/screens/drawer/page/medical_reports/medical_report_details/views/description_results/view.dart';
import 'package:tal3thoom/screens/drawer/page/medical_reports/models/medcial_report_model.dart';

import '../../../../widgets/appBar.dart';
import '../../../../widgets/constants.dart';
import '../../../../widgets/date_convertors.dart';
import '../../../../widgets/loading.dart';
import '../../../view.dart';
import 'cubit/medical_report_details_cubit.dart';
import 'views/description_results/background_info.dart';
import 'views/description_results/concern.dart';
import 'views/description_results/no_head.dart';
import 'views/description_results/recommendation.dart';
import 'views/description_results/ssrc.dart';
import 'views/description_results/testing.dart';
import 'views/four_tables/view.dart';
import 'views/head_subtitle/view.dart';
import 'views/three_tables/views.dart';

// ignore: must_be_immutable
class MedicalReportsDetails extends StatelessWidget {
  final AllReports allReportsDetails;

  const MedicalReportsDetails({
    Key? key,
    required this.allReportsDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          height: context.height,
          width: context.width,
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) =>
                  MedicalReportDetailsCubit(allReportsDetails: allReportsDetails),
              child: BlocConsumer<MedicalReportDetailsCubit,
                  MedicalReportDetailsState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  final cubit =
                      BlocProvider.of<MedicalReportDetailsCubit>(context);
                  return BlocConsumer<MedicalReportDetailsCubit,
                      MedicalReportDetailsState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      final cubit =
                          BlocProvider.of<MedicalReportDetailsCubit>(context);
                      var content = cubit.allReportsDetails.patient;
                      var pContent = cubit.allReportsDetails;

                      var oasesResult = cubit.allReportsDetails.oasesResults;

                      var videoFrequency = cubit.allReportsDetails.videosFrequencyDetails;
                      if (state is MedicalReportDetailsLoading) {
                        return const Center(child: LoadingFadingCubeGrid());
                      }
                      if (state is MedicalReportDetailsSuccess) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadSubHead(
                                head1: "أسم المريض  ",
                                head2: "Client Name",
                                sunHead: content!.fullName!.toString()),
                            HeadSubHead(
                                head1: "رقم الهوية  ",
                                head2: "ID No",
                                sunHead: content.idCardNumber ?? ""),
                            HeadSubHead(
                                head1: "الجنس  ",
                                head2: "Gender",
                                sunHead: content.gender!),
                            HeadSubHead(
                                head1: "الجنسية  ",
                                head2: "Nationality",
                                sunHead: content.nationality!),
                            HeadSubHead(
                                head1: "تاريخ الميلاد  ",
                                head2: "Date of birth",
                                sunHead: DateConverter.dateConverterMonth(
                                    content.birthDate!.toString())),
                            const HeadSubHead(
                                head1: "المهنة  ",
                                head2: "Occupation	",
                                sunHead: ""),
                            HeadSubHead(
                                head1: "جهة العمل  ",
                                head2: "Work Place",
                                sunHead: content.workPlace!.toString()),
                            HeadSubHead(
                              head1: "تاريخ التسجيل ",
                              head2: "Date of enrolment",
                              sunHead: pContent.enrolmentDate ??"",
                            ),
                            //DateConverter.dateConverterMonth(pContent.enrolmentDate!.toString())??""),
                            HeadSubHead(
                                head1: "تاريخ الخروج ",
                                head2: "Discharge date",
                                sunHead: pContent.dischargeDate??""),
                            ConcernResult(
                              title1: " Area of",
                              title2: "Concern",
                              name: content.firstName!,
                              age: pContent.patientAge??"",
                              sex: content.gender!,
                              fav: pContent.heOrShe??"",
                              cases: pContent.stutteringWasBecoming??"",
                            ),
                            BackGroundInfo(
                              title1: " Background ",
                              title2: "Information",
                              name: content.firstName!,
                              cases: pContent.bornWith??"",
                              schollDegree:
                                  pContent.stutteringNoticedAge??"",
                              sex: content.gender!,
                              upTo: pContent.theStuttering.toString(),
                              finish: pContent.hasBecome.toString(),
                            ),
                            TestingCase(
                                title1: " Fluency ",
                                title2: "Testing",
                                name: content.firstName!),
                            SSRCCase(
                              title1: " Overall Assessment",
                              title2: "(OASES)",
                              name: content.firstName!,
                              her: pContent.hisOrHer??"",
                            ),
                            OverAll(
                              title1: " Overall Assessment",
                              title2: "(Summary)",
                              name: content.firstName!,
                              age: pContent.patientAge??"",
                              mild: pContent.severityEquivalent??"",
                            ),
                            SizedBox(
                              height: context.height * 0.02,
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
                              height: context.height * 0.05,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: customText7(
                                  title: KeysConfig.kScore, color: kBlackText),
                            ),
                            SizedBox(
                              height: context.height * 0.02,
                            ),
                            const FourTables(
                              textColor: kHomeColor,
                              color: kPrimaryColor,
                              title1: "oasasResult",
                              title2: "Impact rating",
                              title3: "Items answered",
                              title4: "Raw score",
                              title5: "Scale",
                            ),
                            const FourTables(
                              textColor: kTextFieldColor,
                              color: kAppBarColor,
                              title1: "",
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



                           /* SizedBox(
                              height: context.height*0.3,
                              child: ListView.builder(
                                shrinkWrap: true,

                                  itemCount: state.allReports.oasesResults?.length,
                                  itemBuilder: (context ,index){
                                //   final qList = state.allReports.oasesResults![index];

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:  const [
                                    FourTables(
                                      textColor: kTextFieldColor,
                                      color: kAppBarColor,
                                      title1: "" ,
                                      title2: "Impact rating",
                                      title3: "Items answered",
                                      title4: "Raw score",
                                      title5: "Scale",
                                    ),
                                    FourTables(
                                      textColor: kTextFieldColor,
                                      color: kHomeColor,
                                      title1: "Impact score",
                                      title2: "Impact rating",
                                      title3: "Items answered",
                                      title4: "Raw score",
                                      title5: "Scale",
                                    ),
                                    FourTables(
                                      textColor: kTextFieldColor,
                                      color: kAppBarColor,
                                      title1: "Impact score",
                                      title2: "Impact rating",
                                      title3: "Items answered",
                                      title4: "Raw score",
                                      title5: "Scale",
                                    ),
                                    FourTables(
                                      textColor: kTextFieldColor,
                                      color: kHomeColor,
                                      title1: "Impact score",
                                      title2: "Impact rating",
                                      title3: "Items answered",
                                      title4: "Raw score",
                                      title5: "Scale",
                                    ),
                                  ],
                                );
                              }),
                            ),*/
                            SizedBox(
                              height: context.height * 0.05,
                            ),

                            NoHead(
                              name: content.firstName!,
                              her: pContent.hisOrHer??"",
                              impactRating: pContent.hisOrHer??"",
                            ),

                            Recommended(
                              title1: "",
                              title2: "Recommendations",
                              name: content.firstName!,
                              her: pContent.hisOrHer??"",
                              mild: pContent.exhibits??"",
                              doctorDep: pContent.specialistName!.toString(),
                              doctorName: pContent.supervisorName!.toString(),
                            ),
                          ],
                        );
                      }
                      if (state is MedicalReportDetailsError) {
                        return Center(child: Text(state.msg));
                      }

                      return const SizedBox();
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
