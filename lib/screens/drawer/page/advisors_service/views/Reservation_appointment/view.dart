import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
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
import '../../cubit/advisor_profile/advisor_profile_cubit.dart';
import '../../models/advisor_model.dart';
import '../../models/profile_dtails.dart';
import '../advisor_payment/view.dart';
import '../spcializer_profile/view.dart';
import 'page/drop_down_all_time.dart';
import 'page/drop_down_available_date.dart';

// ignore: must_be_immutable
class ReservationAppointmentScreen extends StatefulWidget {

   const ReservationAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<ReservationAppointmentScreen> createState() => _ReservationAppointmentScreenState();
}

class _ReservationAppointmentScreenState extends State<ReservationAppointmentScreen> {

  String? adviserId;
  int? adviserIdInt;

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
      body: BlocConsumer<AdvisorProfileCubit, AdvisorProfileState>(
        listener: (context, state) {


       
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AdvisorProfileCubit>(context);

          return SingleChildScrollView(
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
                  const HeadTitles(
                      headTitle: " 1- من فضلك قم بأختيار الأخصائي :"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      DropDownSpecialist(onChanged: (value) {
                       // cubit.getAvailableDatesVisit(value.id!);
                        cubit.onAdvChange(value);
                        adviserId =value.userId;
                        adviserIdInt =value.id;

                        Prefs.setInt("adviserIdInt",adviserIdInt!);

                        setState(() {

                        });
                      }),
                      adviserId == null ? SizedBox(
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width / 3,
                      ): SmallButtonSizer(
                          onPressed: () {
                            navigateTo(context,  SpecializerProfile(advisorId:adviserId!));
                          },
                          title: "الملف الشخصي",
                          color: kPrimaryColor,
                          image: "assets/images/eye1.png"),
                    ],
                  ),
                  const HeadTitles(headTitle: "2- أكثر مدة للجلسة :"),
                    DropDownDurations(
                       userProfileId: Prefs.getInt("adviserIdInt"),
                        onChanged: (value) {
                          cubit.onTimeChange(value);
                          //adviserId =value.userId;
                          setState(() {

                          });
                        }
                    ),
                  const HeadTitles(headTitle: "3- أحتر التاريخ المتاح :"),
                  const DropDownAvailableDates(),
                  Expanded(
                    child: ListView.builder(

                      padding: const EdgeInsets.symmetric(horizontal: 16 ),
                      itemCount: 8,
                     // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8 ),
                          padding: const EdgeInsets.symmetric(horizontal: 8 ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            border: Border.all(color: kPrimaryColor)
                          ),
                          child: ReservationsCard(
                              specialistName: "المتخصص",
                              sessionDate: "10-12-2022",
                              start: "10:16",
                              end: "10:30",
                              onTap: () {
                                navigateTo(context, const PaymentAdvisor());
                              }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
