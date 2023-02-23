import 'package:animate_do/animate_do.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../widgets/appBar.dart';
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
                height: context.height * 0.01,
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
                height: context.height * 0.01,
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
