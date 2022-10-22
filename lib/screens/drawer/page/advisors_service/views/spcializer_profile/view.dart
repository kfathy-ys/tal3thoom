import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/loading.dart';
import '../../../../view.dart';
import '../../cubit/advisor_profile_details/advisor_profile_details_cubit.dart';
import 'views/profile_items.dart';

// ignore: must_be_immutable
class SpecializerProfile extends StatelessWidget {
  final int advisorId;

  const SpecializerProfile({Key? key, required this.advisorId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AdvisorProfileDetailsCubit>(context)
        .getAdvisorsProfileDetails(id: advisorId);

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
          }
          else if (state is AdvisorProfileDetailsSuccess) {
            return
              Center(
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
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              ProfileItems(
                                  title: "الأسم : ",
                                  subTitle:
                                  state.advisorProfile.midName),
                               ProfileItems(
                                  title: "البريد الإلكتروني : ",
                                  subTitle: state.advisorProfile.address),
                               ProfileItems(
                                  title: "سنوات الخبرة : ", subTitle: state.advisorProfile.address),
                               ProfileItems(
                                  title: "التعليم : ", subTitle: state.advisorProfile.address),
                               ProfileItems(
                                  title: "الوظيفة : ", subTitle: state.advisorProfile.address),
                               ProfileItems(
                                  title: "تاريخ الميلاد : ", subTitle: state.advisorProfile.address),
                            ])),
                    Container(
                        color: kAppBarColor,
                        height: context.height * 0.4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: context.width * 0.9,
                        child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: const [
                              ProfileItems(
                                  title: "العنوان : ", subTitle: ""),
                              ProfileItems(
                                  title: "جهة العمل : ", subTitle: ""),
                              ProfileItems(
                                  title: "السيرة الذاتية : ", subTitle: ""),
                              ProfileItems(
                                  title: "الجنسية : ", subTitle: ""),
                              ProfileItems(title: "الجنس : ", subTitle: ""),
                              ProfileItems(
                                  title: "رقم الهوية : ", subTitle: ""),
                              ProfileItems(
                                  title: "سعر جلسة مستشارك : ",
                                  subTitle: ""),
                            ])),
                  ],
                ),
              );


          }
          else  if (state is AdvisorProfileDetailsError) {
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
