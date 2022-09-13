import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../config/keys.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/smallButton.dart';

class PaymentCard extends StatelessWidget {
  final String description;
  final VoidCallback onTapPay;
  final String price;
  const PaymentCard(
      {Key? key,
      required this.description,
      required this.onTapPay,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18),
      width: context.width * 0.6,
      height: context.height * 0.35,
      decoration: BoxDecoration(
        color: kHomeColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: kRoundBorderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomCurvedContainer(
            title: description,
          ),
          customText5(title: price, color: kBlackText),
          SmallButton(
            onPressed: onTapPay,
            title: KeysConfig.payment,
          )
        ],
      ),
    );
  }
}
