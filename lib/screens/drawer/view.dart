import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/auth/login/view.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/views/expention_card/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_induction/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_ssrs_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/resevation_diagnostic/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_induction/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_oases_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_resevation/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_ssrs_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_treatment_ssi4/views/department_one/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/pre-treatment_questionnaire/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/second_session/second_stage_oases_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/second_session/second_stage_ssrs_test/view.dart';
import '../../../../../../config/keys.dart';
import '../home/cubit/home_tabebar_cubit.dart';
import '../home/view.dart';
import '../widgets/loading.dart';
import 'cubit/data_access_permission_cubit.dart';
import 'page/advisors_service/views/Reservation_appointment/view.dart';
import 'page/advisors_service/views/advisor_induction/view.dart';
import 'page/diagnostic_service/page/views/diagnostci_oases_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/view.dart';
import 'package:tal3thoom/screens/drawer/page/medical_reports/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_payment_treatment/view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import 'page/diagnostic_service/page/views/diagnostic_history/view.dart';
import 'page/diagnostic_service/page/views/diagnostic_payment/view.dart';
import 'page/diagnostic_service/page/views/diagnostic_ssi4/views/department_one/view.dart';
import 'page/previous_treatment_sessions/view.dart';
import 'page/treatment_service/page/views/first_session/first_cognitive_session/view.dart';
import 'page/treatment_service/page/views/second_session/second_cognitive_session/view.dart';
import 'page/treatment_service/page/views/second_session/second_stage_resevation/view.dart';
import 'page/treatment_service/page/views/second_session/second_stage_treatment_ssi4/views/department_one/view.dart';
import 'page/treatment_service/page/views/views/expantion_widget.dart';
import 'page/who_we_are/view.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50, top: 65),
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(35),
          bottomEnd: Radius.circular(35),
        )),
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        child:
            BlocConsumer<DataAccessPermissionCubit, DataAccessPermissionState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<DataAccessPermissionCubit>(context);

            if (state is DataAccessPermissionLoading) {
              return const Center(
                child: LoadingFadingCircle(),
              );
            }
            if (state is DataAccessPermissionSuccess) {
              return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListTile(
                      onTap: () {
                        Get.back();
                        BlocProvider.of<HomeTabeBarCubit>(context)
                            .changeIndex(1);
                        Get.to(() => const HomeTabScreen());
                      },
                      leading: Image.asset("assets/images/main.png"),
                      title: customText2(
                          title: KeysConfig.home, color: kHomeColor),
                    ),
                    DiagnosticServices(
                      onTapInductions: () {
                        Get.back();
                        Get.to(() => const InductionDiagnostic());
                      },
                      isPayment: state.accessPermissionModel.data
                                  ?.stagesDiagnosis!.payment ==
                              true
                          ? const Icon(
                              Icons.check_box,
                              color: kTextColor,
                            )
                          : const Text("eeeee"),
                      onTapPayment: () {
                        if (state.accessPermissionModel.data?.stagesDiagnosis!
                                .payment ==
                            false) {
                          Get.back();
                          Get.to(() => const DiagnosticPaymentScreen());
                        } else {
                          return;
                        }
                      },
                      isCaseHistory: state.accessPermissionModel.data
                                  ?.stagesDiagnosis!.caseHistory ==
                              true
                          ? const Icon(
                              Icons.check_box,
                              color: kTextColor,
                            )
                          : const Text("eeeee"),
                      onTapHistory: () {
                        if (state.accessPermissionModel.data?.stagesDiagnosis!
                                .caseHistory ==
                            false) {
                          Get.back();
                          Get.to(() => const DiagnosticHistory());
                        } else {
                          return;
                        }
                      },
                      isOases: state.accessPermissionModel.data
                                  ?.stagesDiagnosis!.oases ==
                              true
                          ? const Icon(
                              Icons.check_box,
                              color: kTextColor,
                            )
                          : const Text("eeeee"),
                      onTapTestOases: () {
                        if (state.accessPermissionModel.data?.stagesDiagnosis!
                                .oases ==
                            false) {
                          Get.back();
                          Get.to(() => const DiagnosticOasesTest());
                        } else {
                          return;
                        }
                      },
                      isSsrs: state.accessPermissionModel.data?.stagesDiagnosis!
                                  .ssrs ==
                              true
                          ? const Icon(
                              Icons.check_box,
                              color: kTextColor,
                            )
                          : const Text("eeeee"),
                      onTapSSRS: () {
                        if (state.accessPermissionModel.data?.stagesDiagnosis!
                                .ssrs ==
                            false) {
                          Get.back();
                          Get.to(() => const SSRSDiagnosticsScreen());
                        } else {
                          return;
                        }
                      },
                      isSsi4: state.accessPermissionModel.data?.stagesDiagnosis!
                                  .ssi4 ==
                              true
                          ? const Icon(
                              Icons.check_box,
                              color: kTextColor,
                            )
                          : const Text("eeeee"),
                      onTapSSi: () {
                        if (state.accessPermissionModel.data?.stagesDiagnosis!
                                .ssi4 ==
                            false) {
                          Get.back();
                          Get.to(() => const DiagnosticSSI4());
                        } else {
                          return;
                        }
                      },
                      isDiagnosticReserved: state.accessPermissionModel.data
                                  ?.stagesDiagnosis!.closeBooking ==
                              true
                          ? const Icon(
                              Icons.check_box,
                              color: kTextColor,
                            )
                          : const Text("eeeee"),
                      onTapAppointentReservation: () {
                        if (state.accessPermissionModel.data?.stagesDiagnosis!
                                .closeBooking ==
                            false) {
                          Get.back();
                          Get.to(() => ReservationDiagnostic());
                        } else {
                          return;
                        }
                      },
                    ),
                    ListTile(
                      onTap: () {
                        Get.back();
                        BlocProvider.of<HomeTabeBarCubit>(context)
                            .changeIndex(2);

                        Get.to(() => const HomeTabScreen());
                      },
                      leading: Image.asset("assets/images/calendar.png"),
                      title: customText2(
                          title: "جدول الحجوزات", color: kHomeColor),
                    ),
                    TreatmentServiceExpansion(
                      onTapInductions: () {
                        Get.back();
                        Get.to(() => const FirstTreatmentInduction());
                      },
                      onTapPayment: () {
                        Get.back();
                        Get.to(() => const FirstPaymentTreatment());
                      },
                      PretreatmentQuestionnaire: () {
                        Get.back();
                        Get.to(() => const PretreatmentQuestionnaire());
                      },
                      onTaptherapeuticSessions: () {
                        Get.back();
                        Get.to(() => const FirstTreatmentSession());
                      },
                      onTapOases: () {
                        Get.back();
                        Get.to(() => const FirstStageOasesTest());
                      },
                      onTapSSRS: () {
                        Get.back();
                        Get.to(() => const FirstStageSSRSTreatmentScreen());
                      },
                      onTapSSI4: () {
                        Get.back();
                        Get.to(() => const TreatmentSSI4());
                      },
                      onTapBookSpecialist: () {
                        Get.back();
                        Get.to(() => FirstStageTreatmentReservation());
                      },
                      onTaptherapeuticSessions2: () {
                        Get.back();
                        Get.to(() => const SecondTreatmentSession());
                      },
                      onTapOases2: () {
                        Get.back();
                        Get.to(() => const SecondStageOasesTest());
                      },
                      onTapSSRS2: () {
                        Get.back();
                        Get.to(() => const SecondStageSSRSTreatmentScreen());
                      },
                      onTapSSI42: () {
                        Get.back();
                        Get.to(() => const SecondTreatmentSSI4());
                      },
                      onTapBookSpecialist2: () {
                        Get.back();
                        Get.to(() => SecondStageTreatmentReservation());
                      },
                    ),
                    ListTile(
                      onTap: () {
                        Get.back();
                        Get.to(() => const ResultsPreviousTreatmentSessions());
                      },
                      leading: Image.asset("assets/images/Files.png"),
                      title: customText2(
                          title: KeysConfig.previousTreatmentSessions,
                          color: kHomeColor),
                    ),
                    ListTile(
                      onTap: () {
                        Get.back();
                        Get.to(() => const MedicalReports());
                      },
                      leading: Image.asset("assets/images/document.png"),
                      title: customText2(
                          title: KeysConfig.medicalReports, color: kHomeColor),
                    ),
                    AdvisorsService(onTapInductions: () {
                      Get.back();
                      Get.to(() => const AdviserInduction());
                    }, onTapAppointmentReservation: () {
                      Get.back();
                      Get.to(() => const ReservationAppointmentScreen());
                    }),
                    ListTile(
                      onTap: () {
                        Get.back();
                        BlocProvider.of<HomeTabeBarCubit>(context)
                            .changeIndex(0);

                        Get.to(() => const HomeTabScreen());
                      },
                      leading: Image.asset("assets/images/personal file.png"),
                      title: customText2(
                          title: KeysConfig.profile, color: kHomeColor),
                    ),
                    ListTile(
                      onTap: () {
                        Get.back();
                        Get.to(() => const WhoWEAreScreen());
                      },
                      leading:
                          Image.asset("assets/images/Exclamation mark.png"),
                      title: customText2(
                          title: KeysConfig.aboutUs, color: kHomeColor),
                    ),
                    ListTile(
                      onTap: () {
                        Get.back();
                      },
                      leading: Image.asset("assets/images/message.png"),
                      title: customText2(
                          title: KeysConfig.contactsUs, color: kHomeColor),
                    ),
                    ListTile(
                      onTap: () {
                        Get.back();
                        Get.to(() => LoginScreen());

                        Prefs.clear();
                      },
                      leading: Image.asset("assets/images/Exit.png"),
                      title: customText2(
                          title: KeysConfig.signOut, color: kHomeColor),
                    ),
                  ]);
            }
            if (state is DataAccessPermissionError) {
              return Text(state.msg);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
