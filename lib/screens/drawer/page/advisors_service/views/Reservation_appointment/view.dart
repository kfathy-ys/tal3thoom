import 'package:tal3thoom/screens/drawer/page/advisors_service/views/Reservation_appointment/page/card_item.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/views/Reservation_appointment/page/card_reservation.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/views/Reservation_appointment/page/drop_down_spcialist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/screens/widgets/smallButtonSizer.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/fast_widget.dart';
import '../../../../view.dart';
import '../advisor_payment/view.dart';
import '../spcializer_profile/view.dart';
import 'page/drop_down_available_date.dart';
import 'page/drop_down_duration.dart';

// ignore: must_be_immutable
class ReservationAppointmentScreen extends StatelessWidget {
  const ReservationAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTileContainer(
                  widthh: context.width * 0.5,
                  title: "حجز المواعيد",
                  context: context),
              const HeadTitles(headTitle: " 1- من فضلك قم بأختيار الأخصائي :"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DropDownSpecialist(),
                  SmallButtonSizer(
                      onPressed: () {
                        navigateTo(context, const SpecializerProfile());
                      },
                      title: "الملف الشخصي",
                      color: kPrimaryColor,
                      image: "assets/images/eye1.png"),
                ],
              ),
              const HeadTitles(headTitle: "2- أكثر مدة للجلسة :"),
              const DropDownDurations(),
              const HeadTitles(headTitle: "3- أحتر التاريخ المتاح :"),
              const DropDownAvailableDates(),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 8,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ReservationsCard(
                        specialistName: "المتخصص",
                        sessionDate: "10-12-2022",
                        start: "10:16",
                        end: "10:30",
                        onTap: () {
                          navigateTo(context, const PaymentAdvisor());
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
