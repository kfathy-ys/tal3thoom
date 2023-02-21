import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart' as g;
import 'config/provider_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/queen.dart';

import 'config/bloc_observer.dart';
import 'config/http_certifications.dart';
import 'config/themes/theme_cubit/switch_cubit.dart';
import 'config/themes/theme_cubit/switch_state.dart';
import 'screens/splash/view.dart';
import 'screens/translations/locale key-value.dart';
import 'screens/widgets/constants.dart';
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();
    //await EasyLocalization.ensureInitialized();

    await App.boot();
    await Firebase.initializeApp();
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
              enabled: false, builder: (context) => const MyApp());
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
      providers: ProviderList.getProviders(),
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          return GetMaterialApp(
            // getPages: AppPages.routes,
            translations: LocaleString(),
            locale: const Locale('ar', 'EG'),
            debugShowCheckedModeBanner: false,

            popGesture: true,
            defaultTransition: g.Transition.zoom,
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
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
