import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/auth/login/view.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/views/expention_card/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_induction/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_ssrs_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/resevation_diagnostic/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_oases_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_resevation/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_ssrs_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_treatment_ssi4/views/department_one/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_treatment_session/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/pre-treatment_questionnaire/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/second_session/second_stage_oases_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/second_session/second_stage_ssrs_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/second_session/second_stage_treatment_ssi4/views/department_two/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/second_session/second_treatment_sessions/view.dart';
import '../../../../../../config/keys.dart';

import '../home/cubit/home_tabebar_cubit.dart';
import '../home/view.dart';
import 'page/advisors_service/views/Reservation_appointment/view.dart';
import 'page/advisors_service/views/advisor_induction/view.dart';
import 'page/diagnostic_service/page/views/diagnostci_oases_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/view.dart';
import 'package:tal3thoom/screens/drawer/page/medical_reports/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_payment_treatment/view.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/second_session/second_stage_induction/view.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';

import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import 'page/diagnostic_service/page/views/diagnostic_history/view.dart';
import 'page/diagnostic_service/page/views/diagnostic_payment/view.dart';
import 'page/diagnostic_service/page/views/diagnostic_ssi4/views/department_one/view.dart';
import 'page/previous_treatment_sessions/view.dart';
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
              Navigator.of(context).pop();
              BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(1);
              navigateTo(context, const HomeTabScreen());
            },
            leading: Image.asset("assets/images/main.png"),
            title: customText2(title: KeysConfig.home, color: kHomeColor),
          ),

          DiagnosticServices(
            onTapInductions: () {
              Navigator.of(context).pop();
              navigateTo(context, const InductionDiagnostic());
            },
            onTapPayment: () {
              Navigator.of(context).pop();
              navigateTo(context, const DiagnosticPayment());
            },
            onTapHistory: () {
              Navigator.of(context).pop();
              navigateTo(context, const DiagnosticHistory());
            },
            onTapTestOases: () {
              Navigator.of(context).pop();
              navigateTo(context, const DiagnosticOasesTest());
            },
            onTapSSRS: () {
              Navigator.of(context).pop();
              navigateTo(context, const SSRSDiagnosticsScreen());
            },
            onTapSSi: () {
              Navigator.of(context).pop();
              navigateTo(context, DiagnosticSSI4());
            },
            onTapAppointentReservation: () {
              Navigator.of(context).pop();
              navigateTo(context, ReservationDiagnostic());
            },
          ),

          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(2);
              navigateTo(context, const HomeTabScreen());
            },
            leading: Image.asset("assets/images/calendar.png"),
            title: customText2(title: "جدول الحجوزات", color: kHomeColor),
          ),

          TreatmentServiceExpansion(
            onTapInductions: () {
              Navigator.of(context).pop();
              navigateTo(context, const TreatmentServiceInduction());
            },
            onTapPayment: () {
              Navigator.of(context).pop();
              navigateTo(context, const PaymentTreatment());
            },
            PretreatmentQuestionnaire: () {
              Navigator.of(context).pop();
              navigateTo(context, const PretreatmentQuestionnaire());
            },
            onTaptherapeuticSessions: () {
              Navigator.of(context).pop();
              navigateTo(context, const FirstTreatmentSession());
            },
            onTapOases: () {
              Navigator.of(context).pop();
              navigateTo(context, const FirstStageOasesTest());
            },
            onTapSSRS: () {
              Navigator.of(context).pop();
              navigateTo(context, const FirstStageSSRSTreatmentScreen());
            },
            onTapSSI4: () {
              Navigator.of(context).pop();
              navigateTo(context, const TreatmentSSI4());
            },
            onTapBookSpecialist: () {
              Navigator.of(context).pop();
              navigateTo(context, const FirstStageTreatmentReservation());
            },
            onTaptherapeuticSessions2: () {
              Navigator.of(context).pop();
              navigateTo(context, const SecondTreatmentSession());
            },
            onTapOases2: () {
              Navigator.of(context).pop();
              navigateTo(context, const SecondStageOasesTest());
            },
            onTapSSRS2: () {
              Navigator.of(context).pop();
              navigateTo(context, const SecondStageSSRSTreatmentScreen());
            },
            onTapSSI42: () {
              Navigator.of(context).pop();
              navigateTo(context, const SecondTreatmentSSI4Two());
            },
            onTapBookSpecialist2: () {
              Navigator.of(context).pop();
              navigateTo(context, const FirstStageTreatmentReservation());
            },
          ),

          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              navigateTo(context, const ResultsPreviousTreatmentSessions());
            },
            leading: Image.asset("assets/images/Files.png"),
            title: customText2(
                title: KeysConfig.previousTreatmentSessions, color: kHomeColor),
          ),

          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              navigateTo(context, const MedicalReports());
            },
            leading: Image.asset("assets/images/document.png"),
            title: customText2(
                title: KeysConfig.medicalReports, color: kHomeColor),
          ),
          AdvisorsService(onTapInductions: () {
            Navigator.of(context).pop();
            navigateTo(context, const AdviserInduction());
          }, onTapAppointmentReservation: () {
            Navigator.of(context).pop();
            navigateTo(context, const ReservationAppointmentScreen());
          }),

          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(0);
              navigateTo(context, const HomeTabScreen());
            },
            leading: Image.asset("assets/images/personal file.png"),
            title: customText2(title: KeysConfig.profile, color: kHomeColor),
          ),

          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              navigateTo(context, const WhoWEAreScreen());
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
              Navigator.of(context).pop();
              // navigateTo(context, const WhoWEAreScreen());
            },
            leading: Image.asset("assets/images/message.png"),
            title: customText2(title: KeysConfig.contactsUs, color: kHomeColor),
          ),

          ListTile(
            onTap: () {
              Navigator.of(context).pop();

              navigateTo(context, LoginScreen());
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
