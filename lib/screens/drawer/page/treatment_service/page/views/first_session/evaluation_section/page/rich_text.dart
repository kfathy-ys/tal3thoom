import 'package:flutter/material.dart';

import '../../../../../../../../widgets/constants.dart';

class RichTextCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: 'ماهو تقيمك لنفسك في الجلسة الحالية ؟ حيث ان ',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontFamily: 'DinMedium')),
            TextSpan(
              text: ' 1 ',
              style: TextStyle(fontWeight: FontWeight.bold, color: kBlackText),
            ),
            TextSpan(
              text: 'تعني غير قادر علي أداء التمرين و ',
              style: TextStyle(
                  color: kPrimaryColor, fontSize: 14, fontFamily: 'DinMedium'),
            ),
            TextSpan(
              text: ' 9',
              style: TextStyle(fontWeight: FontWeight.bold, color: kBlackText),
            ),
            TextSpan(
              text: ' قادر علي أداء التمرين بنجاح ',
              style: TextStyle(
                  color: kPrimaryColor, fontSize: 14, fontFamily: 'DinMedium'),
            ),
          ],
        ),
      ),
    );
  }
}

class RichTextCustom2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text:
                    'ماهو تقيم المتوقع أن تعطبة لنفسك في الجلسة القادمة ؟ حيث أن  ',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontFamily: 'DinMedium')),
            TextSpan(
              text: ' 1 ',
              style: TextStyle(fontWeight: FontWeight.bold, color: kBlackText),
            ),
            TextSpan(
              text: 'تعني غير قادر علي أداء التمرين و ',
              style: TextStyle(
                  color: kPrimaryColor, fontSize: 14, fontFamily: 'DinMedium'),
            ),
            TextSpan(
              text: ' 9',
              style: TextStyle(fontWeight: FontWeight.bold, color: kBlackText),
            ),
            TextSpan(
              text: ' قادر علي أداء التمرين بنجاح ',
              style: TextStyle(
                  color: kPrimaryColor, fontSize: 14, fontFamily: 'DinMedium'),
            ),
          ],
        ),
      ),
    );
  }
}
