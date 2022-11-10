import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../../config/keys.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../../widgets/video_items.dart';
import '../../../../../../view.dart';
import '../../first_session/first_payment_treatment/view.dart';
import 'cubit/first_statge_induction_cubit.dart';

// ignore: must_be_immutable
class FirstTreatmentInduction extends StatelessWidget {
  const FirstTreatmentInduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
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
                  child: BlocConsumer<FirstStageInductionCubit, FirstStageInductionState>(
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
                        return SizedBox(
                          width: context.width * 0.8,
                          height: context.height * 0.25,
                          //'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'

                          // "http://dev-sas.cpt-it.com/api/media/Introduction.mp4"
                          ///TODO:: i wanna looking to commitment URL pass , Something in release may be failed
                          child: VideoItems(
                            videoPlayerController: VideoPlayerController.network(
                                "http://dev-sas.cpt-it.com/api/" +
                                    state.inductionDiagnosticModel.data!.videoUrl
                                        .toString()),
                          ),
                        );
                      }
                      if (state is FirstStageInductionError) {
                        return Text(state.msg);
                      }
                      return const SizedBox();                    },
                  ),
                ),
                MediaButton(
                  onPressed: () {


                      Get.off(()=>const FirstPaymentTreatment());

                   // navigateTo(context, const FirstPaymentTreatment());
                  },
                  title: KeysConfig.next,
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

  SizedBox buildSizedBox(double height) =>
      SizedBox(
        height: height * 0.2,
      );
}