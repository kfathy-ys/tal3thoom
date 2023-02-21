import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../config/keys.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/better_video_widget.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../cubit/data_access_permission_cubit.dart';
import '../../../../../../view.dart';
import '../../first_session/first_payment_treatment/view.dart';

// ignore: must_be_immutable
class TreatmentServiceInduction extends StatefulWidget {
  const TreatmentServiceInduction({Key? key}) : super(key: key);

  @override
  State<TreatmentServiceInduction> createState() =>
      _TreatmentServiceInductionState();
}

class _TreatmentServiceInductionState extends State<TreatmentServiceInduction> {
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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset("assets/images/treatmentDis.png"),
                ),
                Container(
                  margin: const EdgeInsets
                      .symmetric(vertical: 8),
                  width: context.width * 0.8,
                  height:
                  context.height * 0.25,
                  child:

                      // BetterVideoItems(video:      BetterPlayer.network(
                      //   'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                      //
                      //   betterPlayerConfiguration: const BetterPlayerConfiguration(
                      //     aspectRatio: 16 / 9,
                      //   ),
                      // ),
                      //
                      //
                      //
                      //
                      // ),
                      //

                      const VideoScreen(
                    url:
                        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                  ),
                ),
                MediaButton(
                  onPressed: () {
                    navigateTo(context, FirstPaymentTreatment());
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

  SizedBox buildSizedBox(double height) => SizedBox(
        height: height * 0.2,
      );
}
