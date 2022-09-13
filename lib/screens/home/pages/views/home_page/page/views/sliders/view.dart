import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sliders extends StatelessWidget {
  final String title;
  final String subTitle;

  const Sliders({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      height: context.height * 0.12,
      width: context.width * 0.4,
      decoration: BoxDecoration(
          color: kSmallIconColor, borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,

              //"عدد التحميلات ",
              style: const TextStyle(
                  color: kHomeColor, fontSize: 18, fontFamily: 'DinBold')),
          Text(subTitle,
              //"33355889 ",
              style: const TextStyle(
                  color: kAccentColor, fontSize: 18, fontFamily: 'DinBold')),
        ],
      ),
    );
  }
}
