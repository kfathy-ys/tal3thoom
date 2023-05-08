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
import 'views/head_subtitle/view.dart';

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
              create: (context) => MedicalReportDetailsCubit(
                  allReportsDetails: allReportsDetails),
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

                      var videoFrequency =
                          cubit.allReportsDetails.videosFrequencyDetails;
                      if (state is MedicalReportDetailsLoading) {
                        return const Center(child: LoadingFadingCircle());
                      }
                      if (state is MedicalReportDetailsSuccess) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadSubHead(
                                head1: "أسم المريض  ",
                                head2: "Client Name",
                                sunHead: content!.firstNameEn!+" "+content.lastName!.toString()),
                            HeadSubHead(
                                head1: "رقم الهوية  ",
                                head2: "ID No",
                                sunHead: content.idCardNumber.toString()),
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
                              sunHead: DateConverter.dateConverterMonth(state
                                  .allReports.data!.enrolmentDate!
                                  .toString()),
                            ),
                            //DateConverter.dateConverterMonth(pContent.enrolmentDate!.toString())??""),
                            // (state.allReports.data!.dischargeDate!
                            //         .toString().isEmpty)
                            //     ? const SizedBox.shrink()
                            //     : HeadSubHead(
                            //         head1: "تاريخ الخروج ",
                            //         head2: "Discharge date",
                            //         sunHead: DateConverter.dateConverterMonth(
                            //             state.allReports.data!.dischargeDate!
                            //                 .toString() ??""),
                            //       ),
                            ConcernResult(
                              title1: " Area of",
                              title2: "Concern",
                              name: content.firstNameEn!,
                              age: state.allReports.data!.patientAge.toString(),
                              sex: content.gender!,
                              fav: state.allReports.data!.heOrShe.toString(),
                              cases: state
                                  .allReports.data!.stutteringWasBecoming
                                  .toString(),
                            ),
                            BackGroundInfo(
                              title1: " Background ",
                              title2: "Information",
                              name: content.firstName!,
                              cases: state.allReports.data!.bornWith.toString(),
                              schollDegree: state
                                  .allReports.data!.stutteringNoticedAge
                                  .toString(),
                              sex: content.gender!,
                              upTo: state.allReports.data!.theStuttering
                                  .toString(),
                              finish:
                                  state.allReports.data!.hasBecome.toString(),
                            ),
                            TestingCase(
                                title1: " Fluency ",
                                title2: "Testing",
                                name: content.firstName!),
                            SSRCCase(
                              title1: " Overall Assessment",
                              title2: "(OASES)",
                              name: content.firstName!,
                              her: state.allReports.data!.hisOrHer.toString(),
                            ),
                            OverAll(
                              title1: " Overall Assessment",
                              title2: "(Summary)",
                              name: content.firstName!,
                              age: state.allReports.data!.patientAge.toString(),
                              mild: state.allReports.data!.severityEquivalent
                                  .toString(),
                            ),
                            SizedBox(
                              height: context.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildColumnOases(
                                  context,
                                  width: context.width * 0.15,
                                  title1: "Total Score",
                                  title2: state.allReports.data!.frequencyScore
                                      .toString(),
                                  title3: state.allReports.data!.frequencyScore
                                      .toString(),
                                  title4: state.allReports.data!.durationScore
                                      .toString(),
                                  title5: state.allReports.data!.physicalScore
                                      .toString(),
                                  title6: state.allReports.data!.totalScore
                                      .toString(),
                                  title7: state.allReports.data!.percentileRank
                                      .toString(),
                                  title8: state
                                      .allReports.data!.severityEquivalent
                                      .toString(),
                                ),
                                buildColumnOases(context,
                                    width: context.width * 0.28,
                                    title1: "Findings / Observations",
                                    title2:
                                        "${state.allReports.data!.videosFrequencyDetails!.speakingSample!.sttCount!.toInt()}"
                                                "/" +
                                            state
                                                .allReports
                                                .data!
                                                .videosFrequencyDetails!
                                                .speakingSample!
                                                .ssValue!
                                                .toString(),
                                    title3:
                                        "${state.allReports.data!.videosFrequencyDetails!.readingSample!.sttCount!.toInt()}"
                                                "/" +
                                            state
                                                .allReports
                                                .data!
                                                .videosFrequencyDetails!
                                                .readingSample!
                                                .ssValue!
                                                .toString(),
                                    title4: state
                                        .allReports.data!.stutteringDuration!,
                                    title5: "",
                                    title6: "",
                                    title7: "",
                                    title8: ""),
                                buildColumnOases(context,
                                    width: context.width * 0.4,
                                    title1: "Section of the SSI4",
                                    title2: state
                                        .allReports
                                        .data!
                                        .videosFrequencyDetails!
                                        .speakingSample!
                                        .sectionNameEn!,
                                    title3: state
                                        .allReports
                                        .data!
                                        .videosFrequencyDetails!
                                        .readingSample!
                                        .sectionNameEn!,
                                    title4:
                                        "Duration (average of 3 longest stuttering events)	",
                                    title5: "Physical concomitants",
                                    title6: "Total Overall Score",
                                    title7: "Percentile",
                                    title8: "SSI-4 Severity Rating"),
                              ],
                            ),

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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                buildColumnOases(context,
                                    width: context.width * 0.25,
                                    title1: "Impact rating",
                                    title2: state.allReports.data!.oasesResults!
                                        .section1!.impactRating!,
                                    title3: state.allReports.data!.oasesResults!
                                        .section2!.impactRating!,
                                    title4: state.allReports.data!.oasesResults!
                                        .section3!.impactRating!,
                                    title5: state.allReports.data!.oasesResults!
                                        .section5!.impactRating!),
                                buildColumnOases(context,
                                    width: context.width * 0.12,
                                    title1: "Impact Score",
                                    title2:
                                        "${state.allReports.data!.oasesResults!.section1!.impactDegree}",
                                    title3:
                                        "${state.allReports.data!.oasesResults!.section2!.impactDegree}",
                                    title4:
                                        "${state.allReports.data!.oasesResults!.section3!.impactDegree}",
                                    title5:
                                        "${state.allReports.data!.oasesResults!.section5!.impactDegree}"),
                                buildColumnOases(context,
                                    width: context.width * 0.12,
                                    title1: "Items answered",
                                    title2:
                                        "${state.allReports.data!.oasesResults!.section1!.answeredQuestions!.toInt()}",
                                    title3:
                                        "${state.allReports.data!.oasesResults!.section2!.answeredQuestions!.toInt()}",
                                    title4:
                                        "${state.allReports.data!.oasesResults!.section3!.answeredQuestions!.toInt()}",
                                    title5:
                                        "${state.allReports.data!.oasesResults!.section5!.answeredQuestions!.toInt()}"),
                                buildColumnOases(context,
                                    width: context.width * 0.12,
                                    title1: "Raw score",
                                    title2:
                                        "${state.allReports.data!.oasesResults!.section1!.points!.toInt()}",
                                    title3:
                                        "${state.allReports.data!.oasesResults!.section2!.points!.toInt()}",
                                    title4:
                                        "${state.allReports.data!.oasesResults!.section3!.points!.toInt()}",
                                    title5:
                                        "${state.allReports.data!.oasesResults!.section5!.points!.toInt()}"),
                                buildColumnOases(context,
                                    width: context.width * 0.25,
                                    title1: "Scale",
                                    title2: state.allReports.data!.oasesResults!
                                        .section1!.sectionNameEn!,
                                    title3: state.allReports.data!.oasesResults!
                                        .section2!.sectionNameEn!,
                                    title4: state.allReports.data!.oasesResults!
                                        .section3!.sectionNameEn!,
                                    title5: state.allReports.data!.oasesResults!
                                        .section5!.sectionNameEn!),
                              ],
                            ),

                            SizedBox(
                              height: context.height * 0.05,
                            ),

                            NoHead(
                              name: content.firstName!,
                              her: state.allReports.data!.hisOrHer.toString(),
                              impactRating:
                                  state.allReports.data!.hisOrHer.toString(),
                            ),

                            Recommended(
                              title1: "",
                              title2: "Recommendations",
                              name: content.firstName!,
                              her: state.allReports.data!.hisOrHer.toString(),
                              mild: state.allReports.data!.exhibits.toString(),
                              doctorDep: state.allReports.data!.specialistName!
                                  .toString(),
                              doctorName:
                                  ": " + state.allReports.data!.supervisorName!,
                            ),

                            SizedBox(
                              height: context.height * 0.1,
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

  Widget buildColumnOases(
    BuildContext context, {
    String title6 = "",
    String title7 = "",
    String title8 = "",
    required double width,
    required String title1,
    required String title2,
    required String title3,
    required String title4,
    required String title5,
  }) {
    return Column(
      children: [
        Container(
          height: context.height * 0.08,
          width: width,
          color: kPrimaryColor,
          child: Center(
            child: custom12Text(title: title1, color: kHomeColor),
          ),
        ),
        Container(
          height: context.height * 0.08,
          width: width,
          color: kBackGroundCard,
          child: Center(
            child: custom12Text(title: title2, color: kBlackText),
          ),
        ),
        Container(
          height: context.height * 0.08,
          width: width,
          color: kHomeColor,
          child: Center(
            child: custom12Text(title: title3, color: kBlackText),
          ),
        ),
        Container(
          height: context.height * 0.08,
          width: width,
          color: kBackGroundCard,
          child: Center(
            child: custom12Text(title: title4, color: kBlackText),
          ),
        ),
        Container(
          height: context.height * 0.08,
          width: width,
          color: kHomeColor,
          child: Center(
            child: custom12Text(title: title5, color: kBlackText),
          ),
        ),
        Container(
          height: context.height * 0.08,
          width: width,
          color: kBackGroundCard,
          child: Center(
            child: custom12Text(title: title6, color: kBlackText),
          ),
        ),
        Container(
          height: context.height * 0.08,
          width: width,
          color: kHomeColor,
          child: Center(
            child: custom12Text(title: title7, color: kBlackText),
          ),
        ),
        Container(
          height: context.height * 0.08,
          width: width,
          color: kBackGroundCard,
          child: Center(
            child: custom12Text(title: title8, color: kBlackText),
          ),
        ),
      ],
    );
  }
}
