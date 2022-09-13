import 'package:flutter/material.dart';

import '../../../../../../../../../widgets/constants.dart';
import '../../../../../../../../../widgets/customTextFieldToUploadFile.dart';
import '../../../../../../../../../widgets/smallButtonSizerUploadFile.dart';

class CardUploadVideo extends StatelessWidget {
  final double height;
  final String title;
  final dynamic validator;
  final TextEditingController controller;
  final VoidCallback onPressed1;
  final BuildContext context;
  const CardUploadVideo(
      {Key? key,
      required this.height,
      required this.title,
      this.validator,
      required this.controller,
      required this.onPressed1,
      required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextFieldUploadFile(
          controller: controller,
          validator: validator,
          type: TextInputType.text,
        ),
        SmallButtonSizerUploadFile(
          title: "Browse",
          onPressed: onPressed1,
          color: kTextFieldColor,
          image: "assets/images/eye.png",
        ),
      ],
    );
  }
}
