import 'package:animate_do/animate_do.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../../config/keys.dart';
import '../../../../../../../../config/remote_config.dart';
import '../../../../../../../widgets/alerts.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/better_video_widget.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/fast_widget.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../cubit/data_access_permission_cubit.dart';
import '../../../../../../view.dart';
import '../../first_session/first_payment_treatment/view.dart';
import '../../pre-treatment_questionnaire/view.dart';
import '../../second_session/game_over/view.dart';
import '../../second_session/second_cognitive_session/view.dart';
import '../../second_session/second_stage_oases_test/view.dart';
import '../../second_session/second_stage_resevation/view.dart';
import '../../second_session/second_stage_ssrs_test/view.dart';
import '../../second_session/second_stage_treatment_ssi4/views/department_one/view.dart';
import '../first_cognitive_session/view.dart';
import '../first_stage_oases_test/view.dart';
import '../first_stage_resevation/view.dart';
import '../first_stage_ssrs_test/view.dart';
import '../first_stage_treatment_ssi4/views/department_one/view.dart';
import 'cubit/first_statge_induction_cubit.dart';

// ignore: must_be_immutable
class FirstTreatmentInduction extends StatefulWidget {
  const FirstTreatmentInduction({Key? key}) : super(key: key);

  @override
  State<FirstTreatmentInduction> createState() =>
      _FirstTreatmentInductionState();
}

class _FirstTreatmentInductionState extends State<FirstTreatmentInduction> {
  final FijkPlayer player = FijkPlayer();
  RemoteConfigSetup remoteConfigSetup = RemoteConfigSetup();
  @override
  void initState() {
    remoteConfigSetup.setupRemoteConfig();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataAccessPermissionCubit>(context).getAccessPermission();
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTileContainer(
                    widthh: context.width * 0.5,
                    title: "رحلة العلاج",
                    context: context),
                FadeInUpBig(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset("assets/images/treatmentDis.png"),
                  ),
                ),
                BlocProvider(
                  create: (context) => FirstStageInductionCubit(),
                  child: BlocConsumer<FirstStageInductionCubit,
                      FirstStageInductionState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      final cubit =
                          BlocProvider.of<FirstStageInductionCubit>(context);

                      if (state is FirstStageInductionLoading) {
                        return const Center(
                          child: LoadingFadingCircle(),
                        );
                      }
                      if (state is FirstStageInductionSuccess) {
                        return Column(
                          children: [
                            Container(

                              margin: const EdgeInsets
                                  .symmetric(vertical: 8),
                              width: context.width * 0.8,
                              height:
                              context.height * 0.25,

                              child: VideoScreen(
                                  url:

                                  "http://mcsc-saudi.com/api/" +
                                    state.inductionDiagnosticModel.data!.videoUrl
                                        .toString()

                                      .toString()


                              ),
                            ),
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

                          ],
                        );
                      }
                      if (state is FirstStageInductionError) {
                        return Text(state.msg);
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
                      return  remoteConfigSetup.isAvailable != null  ? MediaButton(
                        onPressed: () {

                          if(  remoteConfigSetup.isAvailable == false  ){
                            print("الحقيييييييييييييييييييقي");

                            if (state.accessPermissionModel.data!.stagesDiagnosis!
                                .closeBooking ==
                                true &&
                                state.accessPermissionModel.data!.stagesTreatment!
                                    .paymentTreatmentOne ==
                                    false) {
                              Get.offAll(() => FirstPaymentTreatment());
                            }

                            if (state.accessPermissionModel.data!.stagesDiagnosis!
                                .closeBooking ==
                                true &&
                                state.accessPermissionModel.data!.stagesTreatment!
                                    .paymentTreatmentOne ==
                                    true &&
                                state.accessPermissionModel.data!.stagesTreatment!
                                    .preTreatment ==
                                    false) {
                              Get.offAll(() => const PretreatmentQuestionnaire());
                            }
                            if (state.accessPermissionModel.data!.stagesTreatment!
                                .preTreatment ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.sessions ==
                                    false) {
                              Get.offAll(() => const FirstTreatmentSession());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentFirst!.sessions ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.oases ==
                                    false) {
                              Get.offAll(() => const FirstStageOasesTest());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentFirst!.oases ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.ssrs ==
                                    false) {
                              Get.offAll(
                                      () => const FirstStageSSRSTreatmentScreen());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentFirst!.ssrs ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.ssi4 ==
                                    false) {
                              Get.offAll(() => const TreatmentSSI4());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentFirst!.ssi4 ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.booking ==
                                    false) {
                              Get.offAll(() => FirstStageTreatmentReservation());
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
                            // ///////////////////////////////////////
                            //
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentFirst!.closeBooking ==
                                true &&
                                state.accessPermissionModel.data!.stagesTreatment!
                                    .paymentTreatmentTwo ==
                                    false) {
                              Get.offAll(() => FirstPaymentTreatment());
                            }

                            if (state.accessPermissionModel.data!.stagesTreatment!
                                .paymentTreatmentTwo ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.closeBooking ==
                                    true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.sessions ==
                                    false) {
                              Get.offAll(() => const SecondTreatmentSession());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentSecond!.sessions ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.oases ==
                                    false) {
                              Get.offAll(() => const SecondStageOasesTest());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentSecond!.oases ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.ssrs ==
                                    false) {
                              Get.offAll(
                                      () => const SecondStageSSRSTreatmentScreen());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentSecond!.ssrs ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.ssi4 ==
                                    false) {
                              Get.offAll(() => const SecondTreatmentSSI4());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentSecond!.ssi4 ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.booking ==
                                    false) {
                              Get.offAll(() => SecondStageTreatmentReservation());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentSecond!.booking ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.closeBooking ==
                                    true) {
                              Get.offAll(() => const GameOver());
                            }

                          }
                          else if(remoteConfigSetup.isAvailable== true  ){

                            print("faaaaaaaaaaaaaaaaaaake");
                            // if (state.accessPermissionModel.data!.stagesDiagnosis!
                            //     .closeBooking ==
                            //     true &&
                            //     state.accessPermissionModel.data!.stagesTreatment!
                            //         .paymentTreatmentOne ==
                            //         false) {
                            //   Get.offAll(() => FirstPaymentTreatment());
                            // }

                            if (state.accessPermissionModel.data!.stagesDiagnosis!
                                .closeBooking ==
                                true &&
                                state.accessPermissionModel.data!.fakeP ==
                                    true &&
                                state.accessPermissionModel.data!.stagesTreatment!
                                    .preTreatment ==
                                    false) {
                              Get.offAll(() => const PretreatmentQuestionnaire());
                            }
                            if (state.accessPermissionModel.data!.stagesTreatment!
                                .preTreatment ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.sessions ==
                                    false) {
                              Get.offAll(() => const FirstTreatmentSession());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentFirst!.sessions ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.oases ==
                                    false) {
                              Get.offAll(() => const FirstStageOasesTest());
                            }

                            if (state.accessPermissionModel.data!
                                .stagesTreatmentFirst!.oases ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.ssrs ==
                                    false) {
                              Get.offAll(
                                      () => const FirstStageSSRSTreatmentScreen());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentFirst!.ssrs ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.ssi4 ==
                                    false) {
                              Get.offAll(() => const TreatmentSSI4());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentFirst!.ssi4 ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.booking ==
                                    false) {
                              Get.offAll(() => FirstStageTreatmentReservation());
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
                            // ///////////////////////////////////////
                            //
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentFirst!.closeBooking ==
                                true &&
                                state.accessPermissionModel.data!.stagesTreatment!
                                    .paymentTreatmentTwo ==
                                    false) {
                              Get.offAll(() => FirstPaymentTreatment());
                            }

                            if (state.accessPermissionModel.data!.stagesTreatment!
                                .paymentTreatmentTwo ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentFirst!.closeBooking ==
                                    true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.sessions ==
                                    false) {
                              Get.offAll(() => const SecondTreatmentSession());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentSecond!.sessions ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.oases ==
                                    false) {
                              Get.offAll(() => const SecondStageOasesTest());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentSecond!.oases ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.ssrs ==
                                    false) {
                              Get.offAll(
                                      () => const SecondStageSSRSTreatmentScreen());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentSecond!.ssrs ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.ssi4 ==
                                    false) {
                              Get.offAll(() => const SecondTreatmentSSI4());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentSecond!.ssi4 ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.booking ==
                                    false) {
                              Get.offAll(() => SecondStageTreatmentReservation());
                            }
                            if (state.accessPermissionModel.data!
                                .stagesTreatmentSecond!.booking ==
                                true &&
                                state.accessPermissionModel.data!
                                    .stagesTreatmentSecond!.closeBooking ==
                                    true) {
                              Get.offAll(() => const GameOver());
                            }

                          }
                                               },
                        title: KeysConfig.next,
                      ):const LoadingFadingCircle();
                    }
                    if (state is DataAccessPermissionError) {
                      return Text(state.msg);
                    }

                    return const SizedBox();
                  },
                ),
                SizedBox(
                  height: context.height * 0.15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(
        height: height * 0.2,
      );
}
