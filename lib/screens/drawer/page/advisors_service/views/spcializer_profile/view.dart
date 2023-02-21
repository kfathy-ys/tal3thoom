import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/date_convertors.dart';
import '../../../../../widgets/loading.dart';
import '../../../../view.dart';
import '../../cubit/advisor_profile_details/advisor_profile_details_cubit.dart';
import 'views/profile_items.dart';

// ignore: must_be_immutable
class SpecializerProfile extends StatelessWidget {
  final String advisorId;

  const SpecializerProfile({Key? key, required this.advisorId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AdvisorProfileDetailsCubit>(context)
        .getAdvisorsProfileDetails(userProfileId: advisorId);

    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body:
          BlocConsumer<AdvisorProfileDetailsCubit, AdvisorProfileDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AdvisorProfileDetailsLoading) {
            return const LoadingFadingCircle();
          } else if (state is AdvisorProfileDetailsSuccess) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTileContainer(
                        widthh: context.width * 0.6,
                        title: "الملف الشخصي للمختص",
                        context: context),
                    Container(
                      color: kRoundBorderColor,
                      height: context.height * 0.12,
                      width: context.width * 0.9,
                      child: Center(
                        child: Image.asset("assets/images/avater2.png"),
                      ),
                    ),
                    Container(
                        color: kAppBarColor,
                        height: context.height * 0.3,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: context.width * 0.9,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileItems(
                                  title: "الأسم : ",
                                  subTitle: state.advisorProfile.firstName!),
                              ProfileItems(
                                  title: "البريد الإلكتروني : ",
                                  subTitle: state.advisorProfile.email!),
                              ProfileItems(
                                  title: "سنوات الخبرة : ",
                                  subTitle: state.advisorProfile.experienceYears
                                      .toString()),
                              ProfileItems(
                                  title: "التعليم : ",
                                  subTitle: state.advisorProfile.education
                                      .toString()),
                              ProfileItems(
                                  title: "الوظيفة : ",
                                  subTitle:
                                      state.advisorProfile.job.toString()),
                              ProfileItems(
                                  title: "تاريخ الميلاد : ",
                                  subTitle: DateConverter.dateConverterMonth(
                                      state.advisorProfile.birthDate
                                          .toString())),
                            ])),
                    Container(
                        color: kAppBarColor,
                        height: context.height * 0.5,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: context.width * 0.9,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileItems(
                                  title: "العنوان : ",
                                  subTitle: state.advisorProfile.address!),
                              ProfileItems(
                                  title: "جهة العمل : ",
                                  subTitle: state.advisorProfile.employer!),
                              // ProfileItems(
                              //     title: "السيرة الذاتية : ",
                              //     subTitle: state.advisorProfile.attachmentName
                              //         .toString()),
                              ProfileItems(
                                  title: "الجنسية : ",
                                  subTitle: state.advisorProfile.nationality
                                      .toString()),
                              ProfileItems(
                                  title: "الجنس : ",
                                  subTitle:
                                      state.advisorProfile.gender.toString()),
                              ProfileItems(
                                  title: "رقم الهوية : ",
                                  subTitle: state.advisorProfile.idCardNumber
                                      .toString()),
                              ProfileItems(
                                  title: "سعر جلسة مستشارك : ",
                                  subTitle: state.advisorProfile
                                          .consultationPriceInHour
                                          .toString() +
                                      " " +
                                      "(ر.س) / فى الساعة"),
                              ProfileItems(
                                  title: "سعر جلسة مستشارك : ",
                                  subTitle: state.advisorProfile
                                          .consultationPriceIn45Minute
                                          .toString() +
                                      " " +
                                      "(ر.س) / 45 دقيقة"),
                              ProfileItems(
                                  title: "سعر جلسة مستشارك : ",
                                  subTitle: state.advisorProfile
                                          .consultationPriceIn30Minute
                                          .toString() +
                                      " " +
                                      "(ر.س) / 30 دقيقة"),
                              ProfileItems(
                                  title: "سعر جلسة مستشارك : ",
                                  subTitle: state.advisorProfile
                                          .consultationPriceIn15Minute
                                          .toString() +
                                      " " +
                                      "(ر.س) / 15 دقيقة"),
                            ])),
                  ],
                ),
              ),
            );
          } else if (state is AdvisorProfileDetailsError) {
            return Text(state.msg);
          }

          return const SizedBox();
        },
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(
        height: height * 0.05,
      );
}
