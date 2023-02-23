import 'package:animate_do/animate_do.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/config/keys.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../widgets/alerts.dart';
import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/fast_widget.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../cubit/data_access_permission_cubit.dart';
import '../../../../../view.dart';
import '../../../../treatment_service/page/views/first_session/first_stage_induction/view.dart';
import '../diagnostci_oases_test/view.dart';
import '../diagnostic_history/view.dart';
import '../diagnostic_payment/view.dart';
import '../diagnostic_ssi4/views/department_one/view.dart';
import '../diagnostic_ssrs_test/view.dart';
import '../resevation_diagnostic/view.dart';
import 'cubit/diagnostic_induction_cubit.dart';

// ignore: must_be_immutable
class InductionDiagnostic extends StatefulWidget {
  const InductionDiagnostic({Key? key}) : super(key: key);

  @override
  State<InductionDiagnostic> createState() => _InductionDiagnosticState();
}

class _InductionDiagnosticState extends State<InductionDiagnostic> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    setupRemoteConfig();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTileContainer(
                  widthh: context.width * 0.5,
                  title: KeysConfig.definationDiag,
                  context: context),
              FadeInUpBig(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset("assets/images/dignostics.png"),
                ),
              ),
              BlocProvider(
                create: (context) => DiagnosticInductionCubit(),
                child: BlocConsumer<DiagnosticInductionCubit,
                    DiagnosticInductionState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final cubit =
                        BlocProvider.of<DiagnosticInductionCubit>(context);

                    if (state is DiagnosticInductionLoading) {
                      return const Center(
                        child: LoadingFadingCircle(),
                      );
                    }
                    if (state is DiagnosticInductionSuccess) {
                      print("http://mcsc-saudi.com/api/" +
                          state.inductionDiagnosticModel.data!.videoUrl
                              .toString() +
                          "فووووول");
                      return Column(
                        children: [
                          customTextWatchVideo(
                              onTap: () {
                                navigateTo(
                                    context,
                                    const WebView(
                                      javascriptMode:
                                          JavascriptMode.unrestricted,
                                      initialUrl:
                                          "https://mcsc-saudi.com/intro-videos",
                                    ));
                              },
                              title: "إضغط هنا لمشاهدة الفيديوهات التعريفية",
                              color: kButtonDashBoard),
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          // Container(
                          //
                          //   margin: const EdgeInsets
                          //       .symmetric(vertical: 8),
                          //   width: context.width * 0.8,
                          //   height:
                          //   context.height * 0.25,
                          //   child: VideoScreen(
                          //       url:
                          //
                          //       "http://mcsc-saudi.com/api/" +
                          //         state.inductionDiagnosticModel.data!.videoUrl
                          //             .toString()
                          //
                          //           .toString()
                          //
                          //
                          //   ),
                          // ),
                        ],
                      );
                    }
                    if (state is DiagnosticInductionError) {
                      return Text(state.meg);
                    }
                    return const SizedBox();
                  },
                ),
              ),
              BlocConsumer<DataAccessPermissionCubit,
                  DataAccessPermissionState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is DataAccessPermissionLoading) {
                    return const LoadingFadingCircle();
                  }
                  if (state is DataAccessPermissionSuccess) {
                    return _isAvailable != null
                        ? MediaButton(
                            onPressed: () {
                              if (_isAvailable == false) {
                                print("زي الفل");
                                if (state.accessPermissionModel.data!
                                        .stagesDiagnosis!.payment ==
                                    false) {
                                  Get.offAll(
                                      () => const DiagnosticPaymentScreen());
                                }
                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.payment ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.caseHistory ==
                                        false) {
                                  Get.offAll(() => const DiagnosticHistory());
                                }
                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.caseHistory ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.oases ==
                                        false) {
                                  Get.offAll(() => const DiagnosticOasesTest());
                                }
                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.oases ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.ssrs ==
                                        false) {
                                  Get.offAll(
                                      () => const SSRSDiagnosticsScreen());
                                }
                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.ssrs ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.ssi4 ==
                                        false) {
                                  Get.offAll(() => const DiagnosticSSI4());
                                }
                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.ssi4 ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.booking ==
                                        false) {
                                  Get.offAll(() => ReservationDiagnostic());
                                }

                                if (state.accessPermissionModel.data?.stagesDiagnosis!.booking == true ||

                                    state.accessPermissionModel.data?.stagesTreatmentFirst!.booking == true ||
                                    state.accessPermissionModel.data?.stagesTreatmentFirst!.booking == true


                                ) {
                                  Get.back();
                                  Alert.error(
                                    'تم الحجز مع المتخصص من قبل بنجاح',
                                  );
                                }
                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.booking ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.closeBooking ==
                                        true) {
                                  Get.offAll(
                                      () => const FirstTreatmentInduction());
                                }
                              } else if (_isAvailable == true) {
                                print("فيييييييييييييييييمص");
                                if (state.accessPermissionModel.data!
                                        .stagesDiagnosis!.caseHistory ==
                                    false) {
                                  Get.offAll(() => const DiagnosticHistory());
                                }
                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.caseHistory ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.oases ==
                                        false) {
                                  Get.offAll(() => const DiagnosticOasesTest());
                                }
                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.oases ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.ssrs ==
                                        false) {
                                  Get.offAll(
                                      () => const SSRSDiagnosticsScreen());
                                }
                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.ssrs ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.ssi4 ==
                                        false) {
                                  Get.offAll(() => const DiagnosticSSI4());
                                }
                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.ssi4 ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.booking ==
                                        false) {
                                  Get.offAll(() => ReservationDiagnostic());
                                }

                                if (state.accessPermissionModel.data?.stagesDiagnosis!.booking == true ||

                                    state.accessPermissionModel.data?.stagesTreatmentFirst!.booking == true ||
                                    state.accessPermissionModel.data?.stagesTreatmentFirst!.booking == true


                                ) {
                                  Get.back();
                                  Alert.error(
                                    'تم الحجز مع المتخصص من قبل بنجاح',
                                  );
                                }

                                if (state.accessPermissionModel.data!
                                            .stagesDiagnosis!.booking ==
                                        true &&
                                    state.accessPermissionModel.data!
                                            .stagesDiagnosis!.closeBooking ==
                                        true) {
                                  Get.offAll(
                                      () => const FirstTreatmentInduction());
                                }
                              }
                            },
                            title: KeysConfig.next,
                          )
                        : const LoadingFadingCircle();
                  }
                  if (state is DataAccessPermissionError) {
                    return Text(state.msg);
                  }

                  return const SizedBox();
                },
              ),
              SizedBox(
                height: context.height * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(
        height: height * 0.05,
      );

  bool? _isAvailable;

  Future<RemoteConfig> setupRemoteConfig() async {
    print("-=---00--from start of setupRemoteConfig");
    final RemoteConfig remoteConfig = RemoteConfig.instance;
    await remoteConfig.ensureInitialized();
    await remoteConfig.fetchAndActivate();
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 1),
    ));
    setState(() {
      _isAvailable = remoteConfig.getBool("isAvailable");
    });
    Prefs.setBool("isAvailable", remoteConfig.getBool("isAvailable"));
    print("-=-=-=-=-=-=-=-= ${remoteConfig.getBool("isAvailable")}");
    return remoteConfig;
  }
}
