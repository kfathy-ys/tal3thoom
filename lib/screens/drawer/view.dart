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
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../../config/keys.dart';
import '../../config/remote_config.dart';
import '../home/cubit/home_tabebar_cubit.dart';
import '../home/view.dart';
import '../widgets/alerts.dart';
import '../widgets/fast_widget.dart';
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
  //final bool _isAvailable = Prefs.getBool("isAvailable");
  RemoteConfigSetup remoteConfigSetup = RemoteConfigSetup();

  @override
  void initState() {
    remoteConfigSetup.setupRemoteConfig();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataAccessPermissionCubit>(context).getAccessPermission();

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
                child: LoadingFadingCircleWhite(),
              );
            }
            if (state is DataAccessPermissionSuccess) {
              return remoteConfigSetup.isAvailable == null
                  ? const LoadingFadingCircleWhite()
                  : ListView(physics: const BouncingScrollPhysics(), children: [
                      ListTile(
                        onTap: () {
                          Get.back();
                          BlocProvider.of<HomeTabeBarCubit>(context)
                              .changeIndex(1);
                          Get.offAll(() => const HomeTabScreen());
                        },
                        leading: Image.asset(
                          "assets/images/homenewicon.png",
                          width: context.width * 0.07,
                          height: context.height * 0.04,
                        ),
                        title: customText2(
                            title: KeysConfig.home, color: kHomeColor),
                      ),
                      ListTile(
                        onTap: () {
                          Get.back();
                          navigateTo(
                              context,
                              const WebView(
                                javascriptMode: JavascriptMode.unrestricted,
                                initialUrl:
                                    "https://mcsc-saudi.com/intro-videos",
                              ));
                        },
                        leading: Image.asset(
                          "assets/images/video icon.png",
                          width: context.width * 0.07,
                          height: context.height * 0.04,
                        ),
                        title: customText2(
                            title: KeysConfig.videosInfo, color: kHomeColor),
                      ),
                      DiagnosticServices(
                        onTapInductions: () {
                          Get.back();
                          Get.offAll(() => const InductionDiagnostic());
                        },
                        isPayment: state.accessPermissionModel.data
                                    ?.stagesDiagnosis!.payment ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapPayment: () {
                          if (remoteConfigSetup.isAvailable == false) {
                            if (state.accessPermissionModel.data
                                    ?.stagesDiagnosis!.payment ==
                                false) {
                              Get.back();
                              Get.offAll(() => const DiagnosticPaymentScreen());
                            } else {
                              return;
                            }
                          } else {
                            Get.back();
                            Get.offAll(() => const DiagnosticHistory());
                          }
                        },
                        isCaseHistory: state.accessPermissionModel.data
                                    ?.stagesDiagnosis!.caseHistory ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapHistory: () {
                          if (state.accessPermissionModel.data?.stagesDiagnosis!
                                      .caseHistory ==
                                  false &&
                              state.accessPermissionModel.data?.stagesDiagnosis!
                                      .payment ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const DiagnosticHistory());
                          } else {
                            return;
                          }
                        },
                        isOases: state.accessPermissionModel.data
                                    ?.stagesDiagnosis!.oases ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapTestOases: () {
                          if (state.accessPermissionModel.data?.stagesDiagnosis!
                                      .oases ==
                                  false &&
                              state.accessPermissionModel.data?.stagesDiagnosis!
                                      .caseHistory ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const DiagnosticOasesTest());
                          } else {
                            return;
                          }
                        },
                        isSsrs: state.accessPermissionModel.data
                                    ?.stagesDiagnosis!.ssrs ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapSSRS: () {
                          if (state.accessPermissionModel.data?.stagesDiagnosis!
                                      .ssrs ==
                                  false &&
                              state.accessPermissionModel.data?.stagesDiagnosis!
                                      .oases ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const SSRSDiagnosticsScreen());
                          } else {
                            return;
                          }
                        },
                        isSsi4: state.accessPermissionModel.data
                                    ?.stagesDiagnosis!.ssi4 ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapSSi: () {
                          if (state.accessPermissionModel.data?.stagesDiagnosis!
                                      .ssi4 ==
                                  false &&
                              state.accessPermissionModel.data?.stagesDiagnosis!
                                      .ssrs ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const DiagnosticSSI4());
                          } else {
                            return;
                          }
                        },
                        isDiagnosticReserved: state.accessPermissionModel.data
                                    ?.stagesDiagnosis!.closeBooking ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapAppointentReservation: () {
                          if (state.accessPermissionModel.data?.stagesDiagnosis!
                                      .closeBooking ==
                                  false &&
                              state.accessPermissionModel.data?.stagesDiagnosis!
                                      .booking ==
                                  false &&
                              state.accessPermissionModel.data?.stagesDiagnosis!
                                      .ssi4 ==
                                  true) {
                            Get.back();
                            Get.offAll(() => ReservationDiagnostic());
                          } else {
                            if (state.accessPermissionModel.data
                                    ?.stagesDiagnosis!.booking ==
                                true) {
                              Get.back();
                              Alert.error(
                                'تم الحجز مع المتخصص من قبل بنجاح',
                              );
                            }
                            return;
                          }
                        },
                      ),
                      ListTile(
                        onTap: () {
                          Get.back();
                          BlocProvider.of<HomeTabeBarCubit>(context)
                              .changeIndex(2);

                          Get.offAll(() => const HomeTabScreen());
                        },
                        leading: Image.asset("assets/images/calendar.png"),
                        title: customText2(
                            title: "جدول الحجوزات", color: kHomeColor),
                      ),
                      TreatmentServiceExpansion(
                        onTapInductions: () {
                          Get.back();
                          Get.offAll(() => const FirstTreatmentInduction());
                        },
                        isPayment: state.accessPermissionModel.data
                                    ?.stagesTreatment!.paymentTreatmentAll ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapPayment: () {
                          if (remoteConfigSetup.isAvailable == false) {
                            if (state.accessPermissionModel.data
                                    ?.stagesDiagnosis!.closeBooking ==
                                true) {
                              Get.back();
                              Get.offAll(() => FirstPaymentTreatment());
                            } else {
                              return;
                            }
                          } else if (remoteConfigSetup.isAvailable == true &&
                              state.accessPermissionModel.data?.stagesDiagnosis!
                                      .closeBooking ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const PretreatmentQuestionnaire());
                          }
                        },
                        isQuestionnaire: state.accessPermissionModel.data
                                    ?.stagesTreatment!.preTreatment ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        PretreatmentQuestionnaire: () {
                          if (state.accessPermissionModel.data?.stagesTreatment!
                                      .preTreatment ==
                                  false &&
                              state.accessPermissionModel.data?.stagesTreatment!
                                      .paymentTreatmentOne ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const PretreatmentQuestionnaire());
                          } else {
                            return;
                          }
                        },
                        isFirstSessions: state.accessPermissionModel.data
                                    ?.stagesTreatmentFirst!.sessions ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTaptherapeuticSessions: () {
                          if (state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.sessions ==
                                  false &&
                              state.accessPermissionModel.data?.stagesTreatment!
                                      .preTreatment ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const FirstTreatmentSession());
                          } else {
                            return;
                          }
                        },
                        isOases: state.accessPermissionModel.data
                                    ?.stagesTreatmentFirst!.oases ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapOases: () {
                          if (state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.oases ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.sessions ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const FirstStageOasesTest());
                          } else {
                            return;
                          }
                        },
                        isSsrs: state.accessPermissionModel.data
                                    ?.stagesTreatmentFirst!.ssrs ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapSSRS: () {
                          if (state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.ssrs ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.oases ==
                                  true) {
                            Get.back();
                            Get.offAll(
                                () => const FirstStageSSRSTreatmentScreen());
                          } else {
                            return;
                          }
                        },
                        isSsi4: state.accessPermissionModel.data
                                    ?.stagesTreatmentFirst!.ssi4 ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapSSI4: () {
                          if (state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.ssi4 ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.ssrs ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const TreatmentSSI4());
                          } else {
                            return;
                          }
                        },
                        isReservedFirst: state.accessPermissionModel.data
                                    ?.stagesTreatmentFirst!.closeBooking ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapBookSpecialist: () {
                          if (state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.closeBooking ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.booking ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.ssi4 ==
                                  true) {
                            Get.back();
                            Get.offAll(() => FirstStageTreatmentReservation());
                          } else {
                            if (state.accessPermissionModel.data
                                    ?.stagesTreatmentFirst!.booking ==
                                true) {
                              Get.back();
                              Alert.error(
                                'تم الحجز مع المتخصص من قبل بنجاح',
                              );
                            }
                            return;
                          }
                        },
                        isSessionTwo: state.accessPermissionModel.data
                                    ?.stagesTreatmentSecond!.sessions ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTaptherapeuticSessions2: () {
                          if (state.accessPermissionModel.data?.stagesTreatmentSecond!
                                      .sessions ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentFirst!.closeBooking ==
                                  true &&
                              state.accessPermissionModel.data?.stagesTreatment!
                                      .paymentTreatmentAll ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const SecondTreatmentSession());
                          } else {
                            return;
                          }
                        },
                        isOasesTwo: state.accessPermissionModel.data
                                    ?.stagesTreatmentSecond!.oases ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapOases2: () {
                          if (state.accessPermissionModel.data
                                      ?.stagesTreatmentSecond!.oases ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentSecond!.sessions ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const SecondStageOasesTest());
                          } else {
                            return;
                          }
                        },
                        isSsrsTwo: state.accessPermissionModel.data
                                    ?.stagesTreatmentSecond!.ssrs ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapSSRS2: () {
                          if (state.accessPermissionModel.data
                                      ?.stagesTreatmentSecond!.ssrs ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentSecond!.oases ==
                                  true) {
                            Get.back();
                            Get.offAll(
                                () => const SecondStageSSRSTreatmentScreen());
                          } else {
                            return;
                          }
                        },
                        isSsi4Two: state.accessPermissionModel.data
                                    ?.stagesTreatmentSecond!.ssi4 ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapSSI42: () {
                          if (state.accessPermissionModel.data
                                      ?.stagesTreatmentSecond!.ssi4 ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentSecond!.ssrs ==
                                  true) {
                            Get.back();
                            Get.offAll(() => const SecondTreatmentSSI4());
                          } else {
                            return;
                          }
                        },
                        isReservedTwo: state.accessPermissionModel.data
                                    ?.stagesTreatmentSecond!.closeBooking ==
                                true
                            ? doneWidget(context)
                            : const Text(""),
                        onTapBookSpecialist2: () {
                          if (state.accessPermissionModel.data
                                      ?.stagesTreatmentSecond!.closeBooking ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentSecond!.booking ==
                                  false &&
                              state.accessPermissionModel.data
                                      ?.stagesTreatmentSecond!.ssi4 ==
                                  true) {
                            Get.back();
                            Get.offAll(() => SecondStageTreatmentReservation());
                          } else {
                            if (state.accessPermissionModel.data
                                    ?.stagesTreatmentSecond!.booking ==
                                true) {
                              Get.back();
                              Alert.error(
                                'تم الحجز مع المتخصص من قبل بنجاح',
                              );
                            }
                            return;
                          }
                        },
                      ),
                      ListTile(
                        onTap: () {
                          Get.back();
                          Get.offAll(
                              () => const ResultsPreviousTreatmentSessions());
                        },
                        leading: Image.asset("assets/images/Files.png"),
                        title: customText2(
                            title: KeysConfig.previousTreatmentSessions,
                            color: kHomeColor),
                      ),
                      ListTile(
                        onTap: () {
                          Get.back();
                          Get.offAll(() => const MedicalReports());
                        },
                        leading: Image.asset("assets/images/document.png"),
                        title: customText2(
                            title: KeysConfig.medicalReports,
                            color: kHomeColor),
                      ),
                      AdvisorsService(onTapInductions: () {
                        Get.back();
                        Get.offAll(() => const AdviserInduction());
                      }, onTapAppointmentReservation: () {
                        Get.back();
                        Get.offAll(() => const ReservationAppointmentScreen());
                      }),
                      ListTile(
                        onTap: () {
                          Get.back();
                          BlocProvider.of<HomeTabeBarCubit>(context)
                              .changeIndex(0);

                          Get.offAll(() => const HomeTabScreen());
                        },
                        leading: Image.asset("assets/images/personal file.png"),
                        title: customText2(
                            title: KeysConfig.profile, color: kHomeColor),
                      ),
                      ListTile(
                        onTap: () {
                          Get.back();
                          Get.offAll(() => const WhoWEAreScreen());
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
                          Get.offAll(() => LoginScreen());

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

  Widget doneWidget(BuildContext context) {
    return Container(
      height: context.height * 0.04,
      width: context.height * 0.04,
      decoration: BoxDecoration(
        color: kSafeAreaColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: customText4(title: "تم", color: kHomeColor),
      ),
    );
  }
}
