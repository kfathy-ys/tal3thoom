import 'package:flutter/material.dart';

import '../../../../widgets/constants.dart';
import '../../../../widgets/customButton.dart';


// ignore: must_be_immutable
class ReservationsSchedule extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return   Card(
      color: kHomeColor,
      child: SizedBox(
        height: height,
        width: width ,

        child: Column(
          children: [
            CustomTileContainer(
                widthh: width * 0.5,
                title: "جدول الحجوزات",
                context: context),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 8,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context ,index){
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    height: height*0.45,
                    width: width*0.8,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kTextFieldColor)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(title: "التاريخ", color: kPrimaryColor),
                            customText10(title: "2022-10-25", color: kBlackText)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(title: "اليوم", color: kPrimaryColor),
                            customText10(title: "السبت", color: kBlackText)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(title: "تاريخ الإصدار", color: kPrimaryColor),
                            customText10(title: "2022-10-16", color: kBlackText)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(title: "بدء الجلسة", color: kPrimaryColor),
                            customText10(title: "17:30", color: kBlackText)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(title: "نوع الموعد", color: kPrimaryColor),
                            customText10(title: "جلسة إستشارية", color: kBlackText)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(title: "التقيم", color: kPrimaryColor),
                            customText10(title: "⭐⭐⭐", color: kBlackText)
                          ],
                        ),
                        CustomButton(title: "بدء الجلسة",color: kButtonGreenDark,onPressed: (){},),
                        CustomButton(title: "إلغاء",color: kButtonDashBoard,onPressed: (){},)
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );





  }


}