import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/auth/login/view.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/views/expention_card/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_induction/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_ssrs_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/resevation_diagnostic/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_induction/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_oases_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_resevation/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_ssrs_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_treatment_ssi4/views/department_one/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/pre-treatment_questionnaire/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/second_session/second_stage_oases_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/second_session/second_stage_ssrs_test/view.dart';
import '../../../../../../config/keys.dart';
import '../home/cubit/home_tabebar_cubit.dart';
import '../home/view.dart';
import 'page/advisors_service/views/Reservation_appointment/view.dart';
import 'page/advisors_service/views/advisor_induction/view.dart';
import 'page/diagnostic_service/page/views/diagnostci_oases_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/view.dart';
import 'package:tal3thoom/screens/drawer/page/medical_reports/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_payment_treatment/view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import 'page/diagnostic_service/page/views/diagnostic_history/view.dart';
import 'page/diagnostic_service/page/views/diagnostic_payment/view.dart';
import 'page/diagnostic_service/page/views/diagnostic_ssi4/views/department_one/view.dart';
import 'page/previous_treatment_sessions/view.dart';
import 'page/treatment_service/page/views/first_session/first_cognitive_session/view.dart';
import 'page/treatment_service/page/views/second_session/second_cognitive_session/view.dart';
import 'page/treatment_service/page/views/second_session/second_stage_resevation/view.dart';
import 'page/treatment_service/page/views/second_session/second_stage_treatment_ssi4/views/department_one/view.dart';
import 'page/treatment_service/page/views/views/expantion_widget.dart';
import 'page/who_we_are/view.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 50, top: 65),
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(35),
          bottomEnd: Radius.circular(35),
        )),
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          ListTile(
            onTap: () {
              Get.back();
            //  Navigator.of(context).pop();
              BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(1);

             Get.to(()=>const HomeTabScreen());
             // navigateTo(context, const );
            },
            leading: Image.asset("assets/images/main.png"),
            title: customText2(title: KeysConfig.home, color: kHomeColor),
          ),

          DiagnosticServices(
            onTapInductions: () {
              Get.back();
              Get.to(()=>const InductionDiagnostic());

              // Navigator.of(context).pop();
              // navigateTo(context, const InductionDiagnostic());
            },
            onTapPayment: () {
              Get.back();
              Get.to(()=>const DiagnosticPaymentScreen());
              // Navigator.of(context).pop();
              // navigateTo(context, const DiagnosticPaymentScreen());
            },
            onTapHistory: () {
              Get.back();
              Get.to(()=>const DiagnosticHistory());
              // Navigator.of(context).pop();
              // navigateTo(context, const DiagnosticHistory());
            },
            onTapTestOases: () {
              Get.back();
              Get.to(()=>const DiagnosticOasesTest());
              // Navigator.of(context).pop();
              // navigateTo(context, const DiagnosticOasesTest());
            },
            onTapSSRS: () {
              Get.back();
              Get.to(()=>const SSRSDiagnosticsScreen());
              // Navigator.of(context).pop();
              // navigateTo(context, const SSRSDiagnosticsScreen());
            },
            onTapSSi: () {
              Get.back();
              Get.to(()=> DiagnosticSSI4());
              // Navigator.of(context).pop();
              // navigateTo(context, DiagnosticSSI4());
            },
            onTapAppointentReservation: () {
              Get.back();
              Get.to(()=> ReservationDiagnostic());
              // Navigator.of(context).pop();
              // navigateTo(context, ReservationDiagnostic());
            },
          ),

          ListTile(
            onTap: () {
              Get.back();
              BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(2);

              Get.to(()=>const HomeTabScreen());
              // Navigator.of(context).pop();
              // BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(2);
              // navigateTo(context, const HomeTabScreen());
            },
            leading: Image.asset("assets/images/calendar.png"),
            title: customText2(title: "جدول الحجوزات", color: kHomeColor),
          ),

          TreatmentServiceExpansion(
            onTapInductions: () {
              Get.back();
              Get.to(()=>const FirstTreatmentInduction());
              // Navigator.of(context).pop();
              // navigateTo(context,  const FirstTreatmentInduction());
            },
            onTapPayment: () {
              Get.back();
              Get.to(()=>const FirstPaymentTreatment());

              // Navigator.of(context).pop();
              // navigateTo(context, const FirstPaymentTreatment());
            },
            PretreatmentQuestionnaire: () {
              Get.back();
              Get.to(()=>const PretreatmentQuestionnaire());
              // Navigator.of(context).pop();
              // navigateTo(context, const PretreatmentQuestionnaire());
            },
            onTaptherapeuticSessions: () {

              Get.back();
              Get.to(()=>const FirstTreatmentSession());
              // Navigator.of(context).pop();
              // navigateTo(context, const FirstTreatmentSession());
            },
            onTapOases: () {

              Get.back();
              Get.to(()=>const FirstStageOasesTest());

              // Navigator.of(context).pop();
              // navigateTo(context, const FirstStageOasesTest());
            },
            onTapSSRS: () {
              Get.back();
              Get.to(()=>const FirstStageSSRSTreatmentScreen());

              // Navigator.of(context).pop();
              // navigateTo(context, const FirstStageSSRSTreatmentScreen());
            },
            onTapSSI4: () {
              Get.back();
              Get.to(()=>const TreatmentSSI4());
              //
              // Navigator.of(context).pop();
              // navigateTo(context, const TreatmentSSI4());
            },
            onTapBookSpecialist: () {

              Get.back();
              Get.to(()=> FirstStageTreatmentReservation());

              // Navigator.of(context).pop();
              // navigateTo(context,  FirstStageTreatmentReservation());
            },
            onTaptherapeuticSessions2: () {
              Get.back();
              Get.to(()=>const SecondTreatmentSession());
              //
              // Navigator.of(context).pop();
              // navigateTo(context, const SecondTreatmentSession());
            },
            onTapOases2: () {

              Get.back();
              Get.to(()=>const SecondStageOasesTest());

              // Navigator.of(context).pop();
              // navigateTo(context, const SecondStageOasesTest());
            },
            onTapSSRS2: () {
              Get.back();
              Get.to(()=>const SecondStageSSRSTreatmentScreen());

              // Navigator.of(context).pop();
              // navigateTo(context, const SecondStageSSRSTreatmentScreen());
            },
            onTapSSI42: () {

              Get.back();
              Get.to(()=>const SecondTreatmentSSI4());

              // Navigator.of(context).pop();
              // navigateTo(context, const SecondTreatmentSSI4());
            },
            onTapBookSpecialist2: () {
              Get.back();
              Get.to(()=> SecondStageTreatmentReservation());

              // Navigator.of(context).pop();
              // navigateTo(context,  SecondStageTreatmentReservation());
            },
          ),

          ListTile(
            onTap: () {
              Get.back();
              Get.to(()=>const ResultsPreviousTreatmentSessions());

              // Navigator.of(context).pop();
              // navigateTo(context, const ResultsPreviousTreatmentSessions());
            },
            leading: Image.asset("assets/images/Files.png"),
            title: customText2(
                title: KeysConfig.previousTreatmentSessions, color: kHomeColor),
          ),

          ListTile(
            onTap: () {
              Get.back();
              Get.to(()=>const MedicalReports());

              // Navigator.of(context).pop();
              // navigateTo(context, const MedicalReports());
            },
            leading: Image.asset("assets/images/document.png"),
            title: customText2(
                title: KeysConfig.medicalReports, color: kHomeColor),
          ),
          AdvisorsService(onTapInductions: () {

            Get.back();
            Get.to(()=>const AdviserInduction());

            // Navigator.of(context).pop();
            // navigateTo(context, const AdviserInduction());
          }, onTapAppointmentReservation: () {

            Get.back();
            Get.to(()=> const ReservationAppointmentScreen());

            // Navigator.of(context).pop();
            // navigateTo(context,  ReservationAppointmentScreen());
          }),

          ListTile(
            onTap: () {

              Get.back();
              BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(0);

              Get.to(()=>const HomeTabScreen());

              // Navigator.of(context).pop();
              // BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(0);
              // navigateTo(context, const HomeTabScreen());
            },
            leading: Image.asset("assets/images/personal file.png"),
            title: customText2(title: KeysConfig.profile, color: kHomeColor),
          ),

          ListTile(
            onTap: () {

              Get.back();
              Get.to(()=>const WhoWEAreScreen());
              // Navigator.of(context).pop();
              // navigateTo(context, const WhoWEAreScreen());
            },
            leading: Image.asset("assets/images/Exclamation mark.png"),
            title: customText2(title: KeysConfig.aboutUs, color: kHomeColor),
          ),

          // ListTile(
          //   onTap: (){
          //     Navigator.of( context).pop();
          //     navigateTo(context, LanguagesScreen());
          //   },
          //   leading: Image.asset("assets/images/Exclamation mark.png"),
          //   title: customText2(title: KeysConfig.language , color: kHomeColor),
          // ),
          ListTile(
            onTap: () {

              Get.back();
             // Navigator.of(context).pop();
              // navigateTo(context, const WhoWEAreScreen());
            },
            leading: Image.asset("assets/images/message.png"),
            title: customText2(title: KeysConfig.contactsUs, color: kHomeColor),
          ),

          ListTile(
            onTap: () {
              Get.back();
              Get.to(()=> LoginScreen());

              // Navigator.of(context).pop();
              //
              // navigateTo(context, LoginScreen());
              Prefs.clear();
            },
            leading: Image.asset("assets/images/Exit.png"),
            title: customText2(title: KeysConfig.signOut, color: kHomeColor),
          ),
        ]),
      ),
    );
  }
}
