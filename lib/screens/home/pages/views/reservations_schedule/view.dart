import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/screens/home/pages/views/reservations_schedule/page/views/reservation_card.dart';

import '../../../../widgets/constants.dart';


// ignore: must_be_immutable
class ReservationsSchedule extends StatelessWidget {
       
  const ReservationsSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     // double height = MediaQuery.of(context).size.height;
  //  double width = MediaQuery.of(context).size.width;
    return   Card(
      color: kHomeColor,
      child: SizedBox(
        height: context.height,
        width: context.width ,

        child: Column(
          children: [
            CustomTileContainer(
                widthh: context.width * 0.5,
                title: "جدول الحجوزات",
                context: context),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 8,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context ,index){
                  return ReservationCard(
                      onPressStart: (){},
                      onPressEnd: (){},
                      subTitleData: "2022-10-25",
                      subTitleDay: "السبت",
                      subTitleDataStart: "2022-10-16",
                      subTitleStartSessionData: "17:30",
                      subTitleTypeAppointment: "جلسة إستشارية",
                      subTitleEvaluation: "⭐⭐⭐");



                },
              ),
            )
          ],
        ),
      ),
    );





  }


}