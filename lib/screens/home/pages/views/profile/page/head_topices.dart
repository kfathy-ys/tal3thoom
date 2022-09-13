import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:flutter/material.dart';

class HeadTopics extends StatelessWidget {
  final String title;
  const HeadTopics({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // physics: BouncingScrollPhysics(),
      // shrinkWrap: true,
      children: [
        Text(title,
            style: const TextStyle(
                color: kBlackText, fontSize: 20, fontFamily: 'DinBold')),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8.0),
          child: Image.asset("assets/image/dividerAccent.png"),
        )

        //customSliderText(title: "askLibrarian".tr, color: kBlackText)
      ],
    );
  }
}
