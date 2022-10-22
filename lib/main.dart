import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/view.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/views/advisor_induction/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostci_oases_test/cubit/oases_test_cubit.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/queen.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/view.dart';
import 'package:tal3thoom/screens/drawer/page/medical_reports/cubit/medical_reports_cubit.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_treatment_ssi4/views/department_one/cubit/first_stage_ssi4_one_cubit.dart';
import 'package:tal3thoom/screens/home/pages/views/profile/view.dart';
import 'package:tal3thoom/screens/home/view.dart';

import 'config/bloc_observer.dart';
import 'config/themes/theme_cubit/switch_cubit.dart';
import 'config/themes/theme_cubit/switch_state.dart';
import 'screens/drawer/page/advisors_service/cubit/advisor_profile/advisor_profile_cubit.dart';
import 'screens/drawer/page/advisors_service/cubit/advisor_profile_details/advisor_profile_details_cubit.dart';
import 'screens/drawer/page/advisors_service/views/Reservation_appointment/view.dart';
import 'screens/drawer/page/diagnostic_service/page/views/diagnostci_oases_test/view.dart';
import 'screens/drawer/page/diagnostic_service/page/views/diagnostic_history/cubit/diagnostic_history_question_cubit.dart';
import 'screens/drawer/page/diagnostic_service/page/views/diagnostic_payment/cubit/diagnostic_payment_cubit.dart';
import 'screens/drawer/page/diagnostic_service/page/views/diagnostic_ssi4/cubit/diagnostic_ssi4_first_cubit.dart';
import 'screens/drawer/page/diagnostic_service/page/views/diagnostic_ssrs_test/view.dart';
import 'screens/drawer/page/diagnostic_service/page/views/resevation_diagnostic/cubit/available_dates_cubit.dart';
import 'screens/drawer/page/diagnostic_service/page/views/resevation_diagnostic/page/all_specialists/cubit/diangosic_specialists_cubit.dart';
import 'screens/drawer/page/previous_treatment_sessions/view.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/evaluation_section/cubit/evaluation_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/evaluation_section/view.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/first_payment_treatment/cubit/first_payment_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/first_payment_treatment/view.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/first_stage_induction/view.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/first_stage_oases_test/cubit/first_stage_oases_test_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/first_stage_resevation/cubit/first_available_dates_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/first_stage_ssrs_test/cubit/first_stage_ssrs_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/first_stage_treatment_ssi4/views/department_one/view.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/first_treatment_session/cubit/cognitive_section_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/first_treatment_session/view.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/sloki/cubit/behavioral_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/first_session/sloki/view.dart';
import 'screens/drawer/page/treatment_service/page/views/pre-treatment_questionnaire/cubit/pre_questionnaire_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/pre-treatment_questionnaire/view.dart';
import 'screens/drawer/page/treatment_service/page/views/second_session/second_stage_oases_test/cubit/second_stage_oases_test_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/second_session/second_stage_resevation/cubit/secand_available_dates_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/second_session/second_stage_ssrs_test/cubit/second_stage_ssrs_cubit.dart';
import 'screens/drawer/page/treatment_service/page/views/second_session/second_stage_treatment_ssi4/views/department_one/cubit/second_stage_ssi4_one_cubit.dart';
import 'screens/home/cubit/home_tabebar_cubit.dart';
import 'screens/home/pages/views/reservations_schedule/cubit/booking_cubit.dart';
import 'screens/splash/view.dart';
import 'screens/translations/locale key-value.dart';
import 'screens/widgets/constants.dart';
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    //await EasyLocalization.ensureInitialized();

    await App.boot();
    //await Firebase.initializeApp();
    await GetStorage.init();

    Bloc.observer = MyBlocObserver();
    // FCMConfig.instance.messaging.getToken().then((token) {
    //   print(token);
    // });
    //
    // await FCMConfig.instance.init(
    //   defaultAndroidChannel: const AndroidNotificationChannel(
    //     'high_importance_channel', // same as value from android setup
    //     'Fcm config',
    //     importance: Importance.high,
    //     sound: RawResourceAndroidNotificationSound('notification'),
    //   ),
    //
    //
    //
    //
    // ); // may be nul

    runApp(
      QueenBuilder(
        enableDevtools: false,
        builder: (context) {
          return DevicePreview(
            enabled: true,
            builder: (context) => const MyApp(),
          );
        },
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // systemNavigationBarColor: kButtonRedDark, // navigation bar color
        statusBarColor: kPrimaryColor, // status bar color
      ),
    );
  }, (error, stack) {
    if (kDebugMode) {
      print(error);
      print(stack);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SwitchCubit>(
          create: (context) => SwitchCubit(),
        ),
        // BlocProvider<OasesTestCubit>(
        //   create: (context) => OasesTestCubit(),
        // ),
        BlocProvider<FirstStageOasesTestCubit>(
          create: (context) => FirstStageOasesTestCubit(),
        ),
        BlocProvider<SecondStageOasesTestCubit>(
          create: (context) => SecondStageOasesTestCubit(),
        ),
        BlocProvider<HomeTabeBarCubit>(
          create: (context) => HomeTabeBarCubit(),
        ),
        BlocProvider<DiagnosticPaymentCubit>(
          create: (context) => DiagnosticPaymentCubit(),
        ),
        BlocProvider<DiagnosticHistoryQuestionCubit>(
          create: (context) => DiagnosticHistoryQuestionCubit(),
        ),
        BlocProvider<MedicalReportsCubit>(
          create: (context) => MedicalReportsCubit(),
        ),
        BlocProvider<BookingCubit>(
          create: (context) => BookingCubit(),
        ),
        BlocProvider<DiagnosticSsi4FirstCubit>(
          create: (context) => DiagnosticSsi4FirstCubit(),
        ),
        BlocProvider<AvailableDatesCubit>(
          create: (context) => AvailableDatesCubit(),
        ),
        BlocProvider<DiagnosticSpecialistsCubit>(
          create: (context) => DiagnosticSpecialistsCubit(),
        ),
        BlocProvider<FirstPaymentCubit>(
          create: (context) => FirstPaymentCubit(),
        ),
        BlocProvider<FirstStageSsi4OneCubit>(
          create: (context) => FirstStageSsi4OneCubit(),
        ),
        BlocProvider<FirstAvailableDatesCubit>(
          create: (context) => FirstAvailableDatesCubit(),
        ),
        BlocProvider<SecondStageSsi4OneCubit>(
          create: (context) => SecondStageSsi4OneCubit(),
        ),
        BlocProvider<SecondAvailableDatesCubit>(
          create: (context) => SecondAvailableDatesCubit(),
        ),
        BlocProvider<FirstStageSsrsCubit>(
          create: (context) => FirstStageSsrsCubit(),
        ),
        BlocProvider<SecondStageSsrsCubit>(
          create: (context) => SecondStageSsrsCubit(),
        ),
        BlocProvider<PreQuestionnaireCubit>(
          create: (context) => PreQuestionnaireCubit(),
        ), BlocProvider<AdvisorProfileCubit>(
          create: (context) => AdvisorProfileCubit(),
        ),
        BlocProvider<AdvisorProfileDetailsCubit>(
          create: (context) => AdvisorProfileDetailsCubit(),
        ), BlocProvider<CognitiveSectionCubit>(
          create: (context) => CognitiveSectionCubit(),
        ),BlocProvider<BehavioralCubit>(
          create: (context) => BehavioralCubit(),
        ),BlocProvider<EvaluationCubit>(
          create: (context) => EvaluationCubit(),
        ),
      ],
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          return GetMaterialApp(
            // getPages: AppPages.routes,
            translations: LocaleString(),
            locale: const Locale('ar', 'EG'),
            debugShowCheckedModeBanner: false,
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            localizationsDelegates: const [
              CountryLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child ?? const SizedBox(),
              );
            },
            home:   EvaluationSectionScreen(),
          );
        },
      ),
    );
  }
}
