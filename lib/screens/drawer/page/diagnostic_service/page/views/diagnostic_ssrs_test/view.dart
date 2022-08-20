import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/fast_widget.dart';
import '../../../../../../widgets/video_items.dart';
import '../../../../../view.dart';
import '../../../../treatment_service/page/views/first_session/first_stage_ssrs_test/page/card_number.dart';
import '../diagnostic_ssi4/views/department_one/view.dart';
import '../success_page.dart';

// ignore: must_be_immutable
class SSRSDiagnosticsScreen extends StatefulWidget {
  const SSRSDiagnosticsScreen({Key? key}) : super(key: key);

  @override
  State<SSRSDiagnosticsScreen> createState() => _SSRSDiagnosticsScreenState();
}

class _SSRSDiagnosticsScreenState extends State<SSRSDiagnosticsScreen> {
         bool isPressed0 = false;
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool isPressed5 = false;
  bool isPressed6 = false;
  bool isPressed7 = false;
  bool isPressed8 = false;
  bool isPressed9 = false;
  bool isPressed10 = false;
  bool isPressed11 = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        height: height,
        width: width,
        color: kHomeColor,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTileContainer(
                    widthh: width / 2, title: "إختبار SSRS", context: context),
                customText6(
                  title: "الإختبار التالت SSRS (أختبار الرضا الكلامي)",
                  color: kBlackText,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset("assets/images/255.png"),
                ),
                SizedBox(
                  width: width * 0.8,
                  height: height * 0.25,
                  child: VideoItems(
                    videoPlayerController: VideoPlayerController.network(
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    ),
                  ),
                ),
                SmallButton(
                  onPressed: () {},
                  title: "المقياس",
                  color: kPrimaryColor,
                ),
                Wrap(spacing: 15, runSpacing: 10, children: [
                  CardNumber(
                      title: "3",
                      onTap: () {
                        setState(() {
                          isPressed3 = !isPressed3;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed1 = false;
                          isPressed0 = false;
                          isPressed7 = false;
                          isPressed6 = false;
                          isPressed5 = false;
                          isPressed4 = false;
                          isPressed8 = false;
                          isPressed9 = false;
                          isPressed10 = false;
                          isPressed11 = false;
                        });
                      },
                      color: isPressed3 ? kPrimaryColor : kTextFieldColor),
                  CardNumber(
                    title: "2",
                    onTap: () {
                      setState(() {
                        isPressed2 = !isPressed2;
                        Prefs.setBool("isClicked", true);
                        isPressed3 = false;
                        isPressed1 = false;
                        isPressed0 = false;
                        isPressed7 = false;
                        isPressed6 = false;
                        isPressed5 = false;
                        isPressed4 = false;
                        isPressed8 = false;
                        isPressed9 = false;
                        isPressed10 = false;
                        isPressed11 = false;
                      });
                    },
                    color: isPressed2 ? kPrimaryColor : kTextFieldColor,
                  ),
                  CardNumber(
                      title: "1",
                      onTap: () {
                        setState(() {
                          isPressed1 = !isPressed1;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed3 = false;
                          isPressed0 = false;
                          isPressed7 = false;
                          isPressed6 = false;
                          isPressed5 = false;
                          isPressed4 = false;
                          isPressed8 = false;
                          isPressed9 = false;
                          isPressed10 = false;
                          isPressed11 = false;
                        });
                      },
                      color: isPressed1 ? kPrimaryColor : kTextFieldColor),
                  CardNumber(
                      title: "0",
                      onTap: () {
                        setState(() {
                          isPressed0 = !isPressed0;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed1 = false;
                          isPressed3 = false;
                          isPressed7 = false;
                          isPressed6 = false;
                          isPressed5 = false;
                          isPressed4 = false;
                          isPressed8 = false;
                          isPressed9 = false;
                          isPressed10 = false;
                          isPressed11 = false;
                        });
                      },
                      color: isPressed0 ? kPrimaryColor : kTextFieldColor),
                  CardNumber(
                      title: "7",
                      onTap: () {
                        setState(() {
                          isPressed7 = !isPressed7;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed1 = false;
                          isPressed3 = false;
                          isPressed0 = false;
                          isPressed6 = false;
                          isPressed5 = false;
                          isPressed4 = false;
                          isPressed8 = false;
                          isPressed9 = false;
                          isPressed10 = false;
                          isPressed11 = false;
                        });
                      },
                      color: isPressed7 ? kPrimaryColor : kTextFieldColor),
                  CardNumber(
                      title: "6",
                      onTap: () {
                        setState(() {
                          isPressed6 = !isPressed6;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed1 = false;
                          isPressed3 = false;
                          isPressed0 = false;
                          isPressed7 = false;
                          isPressed5 = false;
                          isPressed4 = false;
                          isPressed8 = false;
                          isPressed9 = false;
                          isPressed10 = false;
                          isPressed11 = false;
                        });
                      },
                      color: isPressed6 ? kPrimaryColor : kTextFieldColor),
                  CardNumber(
                      title: "5",
                      onTap: () {
                        setState(() {
                          isPressed5 = !isPressed5;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed1 = false;
                          isPressed3 = false;
                          isPressed0 = false;
                          isPressed6 = false;
                          isPressed7 = false;
                          isPressed4 = false;
                          isPressed8 = false;
                          isPressed9 = false;
                          isPressed10 = false;
                          isPressed11 = false;
                        });
                      },
                      color: isPressed5 ? kPrimaryColor : kTextFieldColor),
                  CardNumber(
                      title: "4",
                      onTap: () {
                        setState(() {
                          isPressed4 = !isPressed4;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed1 = false;
                          isPressed3 = false;
                          isPressed0 = false;
                          isPressed6 = false;
                          isPressed5 = false;
                          isPressed7 = false;
                          isPressed8 = false;
                          isPressed9 = false;
                          isPressed10 = false;
                          isPressed11 = false;
                        });
                      },
                      color: isPressed4 ? kPrimaryColor : kTextFieldColor),
                  CardNumber(
                      title: "11",
                      onTap: () {
                        setState(() {
                          isPressed11 = !isPressed11;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed1 = false;
                          isPressed3 = false;
                          isPressed0 = false;
                          isPressed6 = false;
                          isPressed5 = false;
                          isPressed7 = false;
                          isPressed8 = false;
                          isPressed9 = false;
                          isPressed10 = false;
                          isPressed4 = false;
                        });
                      },
                      color: isPressed11 ? kPrimaryColor : kTextFieldColor),
                  CardNumber(
                      title: "10",
                      onTap: () {
                        setState(() {
                          isPressed10 = !isPressed10;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed1 = false;
                          isPressed3 = false;
                          isPressed0 = false;
                          isPressed6 = false;
                          isPressed5 = false;
                          isPressed7 = false;
                          isPressed8 = false;
                          isPressed9 = false;
                          isPressed4 = false;
                          isPressed11 = false;
                        });
                      },
                      color: isPressed10 ? kPrimaryColor : kTextFieldColor),
                  CardNumber(
                      title: "9",
                      onTap: () {
                        setState(() {
                          isPressed9 = !isPressed9;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed1 = false;
                          isPressed3 = false;
                          isPressed0 = false;
                          isPressed6 = false;
                          isPressed5 = false;
                          isPressed7 = false;
                          isPressed8 = false;
                          isPressed4 = false;
                          isPressed10 = false;
                          isPressed11 = false;
                        });
                      },
                      color: isPressed9 ? kPrimaryColor : kTextFieldColor),
                  CardNumber(
                      title: "8",
                      onTap: () {
                        setState(() {
                          isPressed8 = !isPressed8;
                          Prefs.setBool("isClicked", true);
                          isPressed2 = false;
                          isPressed1 = false;
                          isPressed3 = false;
                          isPressed0 = false;
                          isPressed6 = false;
                          isPressed5 = false;
                          isPressed7 = false;
                          isPressed4 = false;
                          isPressed9 = false;
                          isPressed10 = false;
                          isPressed11 = false;
                        });
                      },
                      color: isPressed8 ? kPrimaryColor : kTextFieldColor),
                ]),
                CustomButton(
                  color: kPrimaryColor,
                  title: "متابعة",
                  onPressed: () {
                    navigateTo(
                        context,
                        SuccessView(
                          title1: "لقد تم إنتهاء إختبار SSRS بنجاح",
                          title2: "إنتقال إلي إختبار SSI-4",
                          onTap: () => navigateTo(context, DiagnosticSSI4()),
                        ));
                  },
                ),
              ]),
        ),
      ),
    );
  }


}
