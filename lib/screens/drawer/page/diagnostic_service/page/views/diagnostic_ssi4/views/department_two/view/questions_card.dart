import 'package:flutter/material.dart';
import 'package:queen/queen.dart';

import '../../../../../../../../../widgets/constants.dart';

class CardQuestions extends StatelessWidget {
  final dynamic index;
  final String desc;
  const CardQuestions({Key? key, required this.index, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // margin: EdgeInsets.symmetric(horizontal: 16),
        height: context.height * 0.15,
        width: context.width * 0.9,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: context.height * 0.12,
              width: context.width * 0.1,
              color: kPrimaryColor,
              child: Center(
                child: customText4(
                    title: index.toString(), color: kBackGroundCard),
              ),
            ),
            Container(
              color: kSkyLightColor,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: context.height * 0.12,
              width: context.width * 0.8,
              child: Center(
                child: customText4(title: desc, color: kBlackText),
              ),
            )
          ],
        ),
      ),
    );
  }
}
