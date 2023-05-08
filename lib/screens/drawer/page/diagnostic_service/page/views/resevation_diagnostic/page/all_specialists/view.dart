// ignore_for_file: must_be_immutable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../home/cubit/home_tabebar_cubit.dart';
import '../../../../../../../../home/view.dart';
import '../../../../../../../../widgets/appBar.dart';
import '../../../../../../../../widgets/constants.dart';
import '../../../../../../../../widgets/date_convertors.dart';
import '../../../../../../../../widgets/loading.dart';
import '../../../../../../../../widgets/mediaButton.dart';
import '../../../../../../../view.dart';
import 'cubit/diangosic_specialists_cubit.dart';

class DiagnosticAllSpecialists extends StatefulWidget {
  //AvailablePeriods? availablePeriods;

  final String startTime;
  final DateTime date;

  const DiagnosticAllSpecialists(
      {super.key, required this.startTime, required this.date});

  @override
  State<DiagnosticAllSpecialists> createState() =>
      _DiagnosticAllSpecialistsState();
}

class _DiagnosticAllSpecialistsState extends State<DiagnosticAllSpecialists> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DiagnosticSpecialistsCubit>(context).getSpecialists(
      startTime: widget.startTime.toString(),
      date: widget.date.toString(),
    );
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
                  widthh: context.width * 0.7,
                  title: " قائمة جدول المواعيد المتاحة",
                  context: context),
              BlocConsumer<DiagnosticSpecialistsCubit,
                  DiagnosticSpecialistsState>(
                listener: (context, state) {
                  if (state is DiagnosticSpecialistsSuccess) {
                    print(state.allSpecialistModel.data.length);
                    //  navigateTo(context, DiagnosticAllSpecialists(startTime: s,));

                  }
                },
                builder: (context, state) {
                  final cubit =
                      BlocProvider.of<DiagnosticSpecialistsCubit>(context);
                  return state is DiagnosticSpecialistsSuccess
                      ? Expanded(
                          child: state.allSpecialistModel.data.isEmpty
                              ? Center(
                                  child: Column(
                                  children: [
                                    customBoldText(
                                        title: "لا توجد متخصصين متاحين الاّن",
                                        color: kBlackText),
                                    customBoldText(
                                        title:
                                            "حاول بموعد أخر من المواعيد المتاحة",
                                        color: kButtonRedDark),
                                  ],
                                ))
                              : ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  itemCount:
                                      state.allSpecialistModel.data.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      height: context.height * 0.45,
                                      width: context.width * 0.8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: kTextFieldColor)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Image.asset(
                                                "assets/images/avater2.png"),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              customText10(
                                                  title: "جنس الاخصائي",
                                                  color: kPrimaryColor),
                                              customText10(
                                                  title: state
                                                      .allSpecialistModel
                                                      .data[index]
                                                      .gender.toString()=="F" ? "أنثى":"ذكر",
                                                  color: kTextFieldColor)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              customText10(
                                                  title: "العمل",
                                                  color: kPrimaryColor),
                                              customText10(
                                                  title: state
                                                      .allSpecialistModel
                                                      .data[index]
                                                      .employer,
                                                  color: kTextFieldColor)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              customText10(
                                                  title: "اليوم",
                                                  color: kPrimaryColor),
                                              customText10(
                                                  title: state
                                                      .allSpecialistModel
                                                      .data[index]
                                                      .day,
                                                  color: kTextFieldColor)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              customText10(
                                                  title: "التاريخ",
                                                  color: kPrimaryColor),
                                              customText10(
                                                  title: DateConverter
                                                      .dateConverterOnlys(state
                                                          .allSpecialistModel
                                                          .data[index]
                                                          .availableDate),
                                                  color: kTextFieldColor)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              customText10(
                                                  title: "الساعة",
                                                  color: kPrimaryColor),
                                              customText10(
                                                  title: state
                                                      .allSpecialistModel
                                                      .data[index]
                                                      .startTime,
                                                  color: kTextFieldColor)
                                            ],
                                          ),
                                          MediaButton(
                                            onPressed: () {
                                              cubit.diagnosticCreateReservation(
                                                  specialistId: state
                                                      .allSpecialistModel
                                                      .data[index]
                                                      .id);
                                              BlocProvider.of<HomeTabeBarCubit>(
                                                      context)
                                                  .changeIndex(2);

                                              Get.offAll(
                                                  () => const HomeTabScreen());
                                            },
                                            color: kButtonGreenDark,
                                            title: "تاكيد الحجز",
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        )
                      : const LoadingFadingCircleSmall();
                },
              ),

              // BlocConsumer<DiagnosticSpecialistsCubit,
              //     DiagnosticSpecialistsState>(
              //   listener: (context, state) {
              //     // TODO: implement listener
              //   },
              //   builder: (context, state) {
              //
              //     // if (state is DiagnosticSpecialistsLoading) {
              //     //   return const Center(
              //     //     child: LoadingFadingCircle(),
              //     //   );
              //     // }
              //     // if (state is DiagnosticSpecialistsSuccess) {
              //     //
              //     // }
              //     // if (state is DiagnosticSpecialistsError) {
              //     //   return Text(state.msg);
              //     // }
              //     // return const SizedBox();
              //   },
            ],
          ),
        ),
      ),
    );
  }
}
