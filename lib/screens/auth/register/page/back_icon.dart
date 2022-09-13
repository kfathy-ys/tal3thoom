import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:flutter/material.dart';

class IconBack extends StatelessWidget {
  const IconBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 280),
        child: const Icon(Icons.arrow_forward_ios, color: kBlackText),
      ),
    );
  }
}
