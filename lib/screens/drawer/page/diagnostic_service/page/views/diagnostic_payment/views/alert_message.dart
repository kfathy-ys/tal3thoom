import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../../../../widgets/constants.dart';

class AlertMessageToWait extends StatelessWidget {
  const AlertMessageToWait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.079,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //   const SizedBox(width: 20.0, ),
          // const Text(
          //   'تحذير هام !',
          //   style: TextStyle(
          //       fontSize: 20.0, color: kSafeAreasColor, fontFamily: 'DinBold'),
          // ),
          const SizedBox(
            width: 30.0,
          ),
          DefaultTextStyle(
            style: const TextStyle(
                color: kAccentColor, fontSize: 18, fontFamily: 'DinBold'),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "هاااام جدا",
                  textStyle: const TextStyle(
                      color: kButtonRedDark,
                      fontSize: 20,
                      fontFamily: 'DinBold'),
                ),
                TyperAnimatedText(
                  "عزيزي العميل!",
                  textStyle: buildTextStyle(),
                ),
                TyperAnimatedText(
                  "برجاء الإنتظار لحين بدء المتصفح",
                  textStyle: buildAccentTextStyle(),
                ),
                TyperAnimatedText("بشكل أمان طبقا لسياسات التطبيق",
                    textStyle: buildAccentTextStyle()),
                TyperAnimatedText("المدة المحددة بحد أقصي ",
                    textStyle: buildAccentTextStyle()),
                TyperAnimatedText("دقيقتان فقط",
                    textStyle: const TextStyle(
                        color: kButtonRedDark,
                        fontSize: 20,
                        fontFamily: 'DinBold')),
                TyperAnimatedText("بعد اتمام العملية بنجاح",
                    textStyle: buildAccentTextStyle()),
                TyperAnimatedText("من الموقع والرجوع إلي التطبيق",
                    textStyle: buildTextStyle()),
                TyperAnimatedText("برجاء سحب الشاشه الي أسفل ",
                    textStyle: const TextStyle(
                        color: kButtonRedDark,
                        fontSize: 20,
                        fontFamily: 'DinBold')),
                TyperAnimatedText("لتحديث بياناتك داخل التطبيق",
                    textStyle: buildTextStyle()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle buildTextStyle() {
    return const TextStyle(
        color: kBlackText, fontSize: 18, fontFamily: 'DinBold');
  }

  TextStyle buildAccentTextStyle() {
    return const TextStyle(
        color: kPrimaryColor, fontSize: 18, fontFamily: 'DinBold');
  }
}
