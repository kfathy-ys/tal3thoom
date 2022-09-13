import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/config/keys.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/cubit/diagnostic_payment_cubit.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../../widgets/video_items.dart';
import '../../../../../view.dart';
import 'cubit/diagnostic_induction_cubit.dart';

// ignore: must_be_immutable
class InductionDiagnostic extends StatelessWidget {
  const InductionDiagnostic({Key? key}) : super(key: key);

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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/images/dignostics.png"),
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
                    if (state is DiagnosticInductionError) {
                      return Text(state.meg);
                    }
                    return const SizedBox();
                  },
                ),
              ),
              MediaButton(
                onPressed: () {
                  //   Get.to(()=>BlocProvider.of<DiagnosticPaymentCubit>(context).checkDiagnosticPayment() );
                  BlocProvider.of<DiagnosticPaymentCubit>(context)
                      .checkDiagnosticPayment();
                  // navigateTo(context,  BlocProvider.of<DiagnosticPaymentCubit>(context).checkDiagnosticPayment());
                  //Get.to(()=> DiagnosticPayment());
                },
                title: KeysConfig.next,
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
