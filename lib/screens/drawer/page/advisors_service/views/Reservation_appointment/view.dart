import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/views/Reservation_appointment/page/card_item.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/views/Reservation_appointment/page/card_reservation.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/views/Reservation_appointment/page/drop_down_spcialist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/screens/widgets/smallButtonSizer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/date_convertors.dart';
import '../../../../../widgets/fast_widget.dart';
import '../../../../../widgets/loading.dart';
import '../../../../view.dart';
import '../../cubit/advisor_profile/advisor_profile_cubit.dart';
import '../spcializer_profile/view.dart';
import 'page/drop_down_all_time.dart';
import 'page/drop_down_available_date.dart';

// ignore: must_be_immutable
class ReservationAppointmentScreen extends StatefulWidget {
  const ReservationAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<ReservationAppointmentScreen> createState() =>
      _ReservationAppointmentScreenState();
}

class _ReservationAppointmentScreenState
    extends State<ReservationAppointmentScreen> {
  String? adviserId;
  String? showSelectedDate;
  String? newDateToSend;
  int? adviserIdInt;
  int? selectedDate;
  var userId = Prefs.getString("userId");

  @override
  Widget build(BuildContext context) {
     bool _isAvailable = Prefs.getBool("isAvailable");

    // BlocProvider.of<AdvisorProfileCubit>(context).selectedAdvisor;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: BlocConsumer<AdvisorProfileCubit, AdvisorProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<AdvisorProfileCubit>(context);
          return SingleChildScrollView(
            child: SizedBox(
              height: context.height,
              width: context.width,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTileContainer(
                      widthh: context.width * 0.5,
                      title: "حجز المواعيد",
                      context: context),
                  adviserIdInt == null? const SizedBox.shrink():    const HeadTitles(
                      headTitle: " 1- من فضلك قم بأختيار الأخصائي :"),
                  // adviserIdInt == null? Center(
                  //
                  //   child: customBoldText(
                  //       title: "لا توجد مستشارين متاحين الاّن",
                  //       color: kBlackText),
                  //
                  // ):
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       DropDownSpecialist(onChanged: (value) {
                        cubit.onAdvChange(value);
                        adviserId = value.userId;
                        adviserIdInt = value.id;

                        setState(() {});
                      }),
                      adviserId == null
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 14,
                              width: MediaQuery.of(context).size.width / 3,
                            )
                          : SmallButtonSizer(
                              onPressed: () {
                                navigateTo(context,
                                    SpecializerProfile(advisorId: adviserId!));
                              },
                              title: "الملف الشخصي",
                              color: kPrimaryColor,
                              image: "assets/images/eye1.png"),
                    ],
                  ),
                  if (adviserIdInt != null)
                    const HeadTitles(headTitle: "2- أكثر مدة للجلسة :"),
                  if (adviserIdInt != null)
                    DropDownDurations(
                        userProfileId: adviserIdInt,
                        onChanged: (value) {
                          cubit.onTimeChange(value);
                          selectedDate = value;
                          BlocProvider.of<AdvisorProfileCubit>(context)
                              .getAllAdvisors(
                                  userProfileId: adviserIdInt!,
                                  time: selectedDate!,
                                  data: newDateToSend);
                          setState(() {
                            print(selectedDate);
                          });
                        }),
                  if (selectedDate != null)
                    const HeadTitles(headTitle: "3- أحتر التاريخ المتاح :"),
                  if (selectedDate != null)
                    DropDownAvailableDates(
                        userProfileId: adviserIdInt,

                        //Prefs.getInt("adviserIdInt"),
                        time: selectedDate,
                        onChanged: (value) {
                          cubit.onDatesChange(value);
                          showSelectedDate = value;
                          newDateToSend = DateConverter.dateConverterOnlys(
                              showSelectedDate.toString());

                          BlocProvider.of<AdvisorProfileCubit>(context)
                              .getAllAdvisors(
                                  userProfileId: adviserIdInt!,
                                  time: selectedDate!,
                                  data: newDateToSend);
                          print(newDateToSend);
                          setState(() {});
                        }),
                  if (selectedDate != null && newDateToSend != null)
                    BlocConsumer<AdvisorProfileCubit, AdvisorProfileState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is AllAdvisorToReservedLoading) {
                          return const LoadingFadingCircle();
                        }
                        if (state is AllAdvisorToReservedSuccess) {
                          return Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                BlocProvider.of<AdvisorProfileCubit>(context)
                                    .getAllAdvisors(
                                        userProfileId: adviserIdInt!,
                                        time: selectedDate!,
                                        data: newDateToSend);
                                return Future<void>.delayed(
                                    const Duration(seconds: 3));
                              },
                              backgroundColor: kPrimaryColor,
                              color: Colors.white,
                              child: state
                                      .allAdvisorToReservedModel.data!.isEmpty
                                  ? Center(
                                      child: customBoldText(
                                          title:
                                              " لا يوجد مستشارين متاحين الاّن",
                                          color: kBlackText))
                                  : ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      itemCount: state.allAdvisorToReservedModel
                                          .data!.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: context.height * 0.25,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          decoration: BoxDecoration(
                                              color: kSkyLightColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: kPrimaryColor)),
                                          child: ReservationsCard(
                                              specialistName: state
                                                  .allAdvisorToReservedModel
                                                  .data![index]
                                                  .createdBy!,
                                              sessionDate: DateConverter
                                                  .dateConverterOnlys(state
                                                      .allAdvisorToReservedModel
                                                      .data![index]
                                                      .availableDateTime!),
                                              start: state
                                                  .allAdvisorToReservedModel
                                                  .data![index]
                                                  .startTime!,
                                              end: state
                                                  .allAdvisorToReservedModel
                                                  .data![index]
                                                  .endTime!,
                                              onTap: () {
                                               if(_isAvailable == true){
                                                 navigateTo(
                                                     context,
                                                     const WebView(
                                                       javascriptMode: JavascriptMode.unrestricted,
                                                       initialUrl: "https://mcsc-saudi.com/intro-videos",
                                                     ));
                                               }else if(_isAvailable == false){
                                                 navigateTo(
                                                     context,
                                                     WebView(
                                                       javascriptMode:
                                                       JavascriptMode
                                                           .unrestricted,
                                                       initialUrl:
                                                       "http://mcsc-saudi.com/Sas/PaymentConsultant/$userId/${state.allAdvisorToReservedModel.data![index].id!}",
                                                     ));
                                               }

                                              }),
                                        );
                                      },
                                    ),
                            ),
                          );
                        }
                        if (state is AllAdvisorToReservedError) {
                          return Text(state.msg);
                        }

                        return const SizedBox();
                      },
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
