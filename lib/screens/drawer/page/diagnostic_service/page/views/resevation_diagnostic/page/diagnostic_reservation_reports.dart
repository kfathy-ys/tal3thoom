import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../../home/pages/views/reservations_schedule/view.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/mediaButton.dart';
import '../../../../../../view.dart';
import '../../success_page.dart';

// ignore: must_be_immutable
class DiagnosticReservationReport extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kHomeColor,
      drawer: MenueItems(),
      appBar: DynamicAppbar(
          context: context,
          press: () => scaffoldKey.currentState!.openDrawer()),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            CustomTileContainer(
                widthh: width * 0.7,
                title: " قائمة جدول المواعيد المتاحة",
                context: context),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 8,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    height: height * 0.45,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kTextFieldColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset("assets/images/avater2.png"),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(
                                title: "جنس الاخصائي", color: kPrimaryColor),
                            customText10(title: "ذكر", color: kTextFieldColor)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(title: "العمل", color: kPrimaryColor),
                            customText10(title: "وزارة الصحة", color: kTextFieldColor)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(
                                title: "اليوم", color: kPrimaryColor),
                            customText10(title: "الاتنين", color: kTextFieldColor)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(
                                title: "التاريخ", color: kPrimaryColor),
                            customText10(title: "2022-10-29", color: kTextFieldColor)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText10(
                                title: "الساعة", color: kPrimaryColor),
                            customText10(
                                title: "17:59", color: kTextFieldColor)
                          ],
                        ),

                        MediaButton(

                          onPressed: () {
                            navigateTo(context, SuccessView(title1: "لقد تم حجز موعد مع المختص",title2: "إنتقال إلي جدول الحجوزات",
                              onTap: ()=>navigateTo(context, ReservationsSchedule()),));
                          },
                          color: kButtonGreenDark,
                          title: "تاكيد الحجز",
                        ),


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
