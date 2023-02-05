import 'package:animate_do/animate_do.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/better_video_widget.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/fast_widget.dart';
import '../../../../view.dart';
import '../Reservation_appointment/view.dart';

// ignore: must_be_immutable
class AdviserInduction extends StatefulWidget {
  const AdviserInduction({Key? key}) : super(key: key);

  @override
  State<AdviserInduction> createState() => _AdviserInductionState();
}

class _AdviserInductionState extends State<AdviserInduction> {
  final FijkPlayer player = FijkPlayer();

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

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
                  title: "التعريف بخدمة مستشارك",
                  context: context),
              FadeInUpBig(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset("assets/images/advisorInduction.png"),
                ),
              ),

  
              SizedBox(
                height: context.height * 0.02,
              ),
              SizedBox(
                width: context.width * 0.8,
                height: context.height * 0.25,
                child: const VideoScreen(
                  url: 'http://mcsc-saudi.com/api/media/Introduction.mp4',
                ),
              ),
              MediaButton(
                onPressed: () {
                  navigateTo(context, const ReservationAppointmentScreen());
                },
                title: ("ابدأ"),
              ),
              buildSizedBox(context.height),
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
