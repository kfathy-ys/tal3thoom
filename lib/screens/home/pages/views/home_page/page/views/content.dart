import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'list_model.dart';

class CardContent extends StatelessWidget {
  final OurServicesModel model;
  final double fontTitle;
  final double fontSubTitle;

  const CardContent({
    Key? key,
    required this.model,
    required this.fontTitle,
    required this.fontSubTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      width: context.width * 0.42,
      decoration: BoxDecoration(
        color: kBackgroundCardColor,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          model.icon,
          Text(
            model.title.tr,
            maxLines: 2,
            style: TextStyle(
                color: kBlackText, fontSize: fontTitle, fontFamily: "DinBold"),
          ),
          Text(
            model.subTitle.tr,
            maxLines: 2,
            style: TextStyle(
                color: kBlackText,
                fontSize: fontSubTitle,
                fontFamily: "DinLight"),
          ),
        ],
      ),
    );
  }
}

class CardGridContent extends StatelessWidget {
  final OurServicesModel model;
  final double fontTitle;
  final double fontSubTitle;

  const CardGridContent(
      {Key? key,
      required this.model,
      required this.fontTitle,
      required this.fontSubTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    //      onTap: ()=>Get.to(()=>model.route),
    return Container(
      // width: width*0.3,
      decoration: BoxDecoration(
        color: kBackgroundCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            // TODO::: problem
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: model.icon,
          ),
          Text(
            model.title.tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: kBlackText, fontSize: fontTitle, fontFamily: "DinBold"),
          ),
          Text(
            model.subTitle.tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: kBlackText,
                fontSize: fontSubTitle,
                fontFamily: "DinLight"),
          ),
        ],
      ),
    );
  }
}
