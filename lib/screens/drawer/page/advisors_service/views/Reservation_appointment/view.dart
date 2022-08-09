import 'package:tal3thoom/screens/drawer/page/advisors_service/views/Reservation_appointment/page/drop_down_spcialist.dart';
import 'package:tal3thoom/screens/payment/view.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:tal3thoom/screens/widgets/smallButtonSizer.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../config/keys.dart';
import '../../../../../home/pages/views/reservations_schedule/view.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/fast_widget.dart';
import '../../../../../widgets/video_items.dart';
import '../../../../view.dart';
import '../../../diagnostic_service/page/views/success_page.dart';
import 'page/drop_down_duration.dart';



// ignore: must_be_immutable
class ReservationAppointmentScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  ReservationAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: () => scaffoldKey.currentState!.openDrawer()),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width ,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTileContainer(
                  widthh: width * 0.5,
                  title:"حجز موعد" ,
                  context: context),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(alignment: Alignment.topRight,child: customText10(title: " 1- من فضلك قم بأختيار الأخصائي :", color: kBlackText)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children:  [
                  const DropDownSpecialist(),
                  SmallButtonSizer(onPressed: (){

                  }, title: "الملف الشخصي",color: kPrimaryColor,image: "assets/images/eye1.png"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(alignment: Alignment.topRight,child: customText10(title: " 2- أكثر مدة للجلسة :", color: kBlackText)),
              ),
              const DropDownDurations(),

            /*  Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SmallButtonSizer(onPressed: (){

                }, title: "بحث",color: kPrimaryColor,image: "assets/images/right_arrow.png"),
              ),*/
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 8,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      height: height * 0.48,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kPrimaryColor)),
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
                                onTap: ()=>navigateTo(context, Payment()),));
                            },
                            color: kButtonGreenDark,
                            title: "حجز جلسة",
                          ),


                        ],
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(
    height: height * 0.05,
  );
}
