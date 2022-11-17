import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/config/keys.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../../widgets/video_items.dart';
import '../../../../../cubit/data_access_permission_cubit.dart';
import '../../../../../view.dart';
import '../../../../treatment_service/page/views/first_session/first_stage_induction/view.dart';
import '../diagnostci_oases_test/view.dart';
import '../diagnostic_history/view.dart';
import '../diagnostic_payment/cubit/diagnostic_payment_cubit.dart';
import '../diagnostic_payment/view.dart';
import '../diagnostic_ssi4/views/department_one/view.dart';
import '../diagnostic_ssrs_test/view.dart';
import '../resevation_diagnostic/view.dart';
import 'cubit/diagnostic_induction_cubit.dart';

// ignore: must_be_immutable
class InductionDiagnostic extends StatelessWidget {
  const InductionDiagnostic({Key? key}) : super(key: key);

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
                      return SizedBox(
                        width: context.width * 0.8,
                        height: context.height * 0.25,

                        ///TODO:: i wanna looking to commitment URL pass , Something in release may be failed
                        child: VideoItems(
                          videoPlayerController: VideoPlayerController.network(
                              "http://dev-sas.cpt-it.com/api/" +
                                  state.inductionDiagnosticModel.data!.videoUrl
                                      .toString()),
                        ),
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
                    return MediaButton(
                      onPressed: () {
                        if (state.accessPermissionModel.data!.stagesDiagnosis!
                                .payment ==
                            false) {
                          Get.offAll(() => const DiagnosticPaymentScreen());
                        }
                        if (state.accessPermissionModel.data!.stagesDiagnosis!
                                    .payment ==
                                true &&
                            state.accessPermissionModel.data!.stagesDiagnosis!
                                    .caseHistory ==
                                false) {
                          Get.offAll(() => const DiagnosticHistory());
                        }
                        if (state.accessPermissionModel.data!.stagesDiagnosis!
                                    .caseHistory ==
                                true &&
                            state.accessPermissionModel.data!.stagesDiagnosis!
                                    .oases ==
                                false) {
                          Get.offAll(() => const DiagnosticOasesTest());
                        }
                        if (state.accessPermissionModel.data!.stagesDiagnosis!
                                    .oases ==
                                true &&
                            state.accessPermissionModel.data!.stagesDiagnosis!
                                    .ssrs ==
                                false) {
                          Get.offAll(() => const SSRSDiagnosticsScreen());
                        }
                        if (state.accessPermissionModel.data!.stagesDiagnosis!
                                    .ssrs ==
                                true &&
                            state.accessPermissionModel.data!.stagesDiagnosis!
                                    .ssi4 ==
                                false) {
                          Get.offAll(() => const DiagnosticSSI4());
                        }
                        if (state.accessPermissionModel.data!.stagesDiagnosis!
                                    .ssi4 ==
                                true &&
                            state.accessPermissionModel.data!.stagesDiagnosis!
                                    .booking ==
                                false) {
                          Get.offAll(() => ReservationDiagnostic());
                        }
                        if (state.accessPermissionModel.data!.stagesDiagnosis!
                                    .booking ==
                                true &&
                            state.accessPermissionModel.data!.stagesDiagnosis!
                                    .closeBooking ==
                                true) {
                          Get.offAll(() => const FirstTreatmentInduction());
                        }
                      },
                      title: KeysConfig.next,
                    );
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
}
