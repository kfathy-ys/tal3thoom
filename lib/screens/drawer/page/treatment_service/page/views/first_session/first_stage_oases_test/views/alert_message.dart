import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../widgets/constants.dart';

class AlertMessage extends StatelessWidget {
  const AlertMessage({Key? key}) : super(key: key);

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
                  "برجاء التقيم المبادي للمرحلة",
                  textStyle: buildAccentTextStyle(),
                ),
                TyperAnimatedText("التقيم يعطي انطباع مبدائ المختص",
                    textStyle: buildAccentTextStyle()),
                TyperAnimatedText("التقيم سيبدئ من 0 إلي 11",
                    textStyle: buildAccentTextStyle()),
                TyperAnimatedText("حيث أن 0 يعني عم رضاك عن الأسئلة",
                    textStyle: buildTextStyle()),
                TyperAnimatedText("حيث أن 11 يعني الرضا التام",
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
