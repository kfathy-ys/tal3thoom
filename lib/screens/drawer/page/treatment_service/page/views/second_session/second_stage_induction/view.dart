import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../../config/keys.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/video_items.dart';
import '../../../../../../view.dart';
import '../../first_session/first_payment_treatment/view.dart';

// ignore: must_be_immutable
class TreatmentServiceInduction extends StatelessWidget {
  const TreatmentServiceInduction({Key? key}) : super(key: key);

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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset("assets/images/treatmentDis.png"),
                ),
                SizedBox(
                  width: context.width * 0.8,
                  height: context.height * 0.25,
                  child: VideoItems(
                    videoPlayerController: VideoPlayerController.network(
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    ),
                  ),
                ),
                MediaButton(
                  onPressed: () {
                    navigateTo(context, const PaymentTreatment());
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
