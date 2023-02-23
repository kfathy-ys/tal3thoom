import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/home/view.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:tal3thoom/screens/widgets/network_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../auth/login/view.dart';
import '../home/cubit/home_tabebar_cubit.dart';
import '../widgets/fast_widget.dart';
import '../widgets/small_splash_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loggedIn = true;
  var userId = Prefs.getString("userId");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        body: SingleChildScrollView(
        child: Container(
          height: context.height,
          width: context.width,
          color: kHomeColor,
          child: Column(
            children: [
              SizedBox(height: context.height*0.05,),

              // Padding(
              //   padding:  EdgeInsetsDirectional.only(end: context.width*0.7),
              //   child: SizedBox(width: context.width*0.3,height: context.height*0.1,child: Image.asset("assets/images/sideLogo.jpg",)),
              // ),
              // SizedBox(height: context.height*0.03,),

              SizedBox(height: context.height*0.35,width: context.width,child: Image.asset("assets/images/all.png",fit: BoxFit.cover,)),

              SizedBox(height: context.height*0.07,),

              customText16(title: " \"كلامي\"", color: kDarklyColor),
              customText18(title: " \"Mytalk\"", color: kDarklyColor),
              SizedBox(height: context.height*0.02,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.09),
                child: InkWell(
                  onTap: () {
                    navigateTo(
                        context,
                        const WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          initialUrl: "https://mcsc-saudi.com/intro-videos",
                        ));
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text:
                      ' ( هو تطبيق ُيعنى بعلاج اضطراب التلعثم/التأتأة ويمكنك الاطلاع على  ',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "DinMedium",
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: ' الفيديوهات التالية ',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "DinMedium",
                              color: kSkyButton,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: '  للتعرف أكثر على طريقة العلاج التي نقدمها لك أو الاستمرار بالتسجيل ) ',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "DinMedium",
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.height*0.1,),
              FadeInUpBig(
                child: Card(

                  child: SmallSplashButton(onPressed:   () => userId.isNotEmpty
                ? {
                BlocProvider.of<HomeTabeBarCubit>(context)
                    .changeIndex(1),
                Get.offAll(() => const HomeTabScreen()),
                }
                    : Get.offAll(() => LoginScreen()),color: kDarklyColor,title: "سجل الآن")


                  // InkWell(
                  //   onTap: () => userId.isNotEmpty
                  //       ? {
                  //     BlocProvider.of<HomeTabeBarCubit>(context)
                  //         .changeIndex(1),
                  //     Get.offAll(() => const HomeTabScreen()),
                  //   }
                  //       : Get.offAll(() => LoginScreen()),
                  //   child: Image.asset(
                  //     'assets/images/arrow splash icon.png',
                  //     scale: 1.2,
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
    ),
      );
  }

  /* FadeInUpBig(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: kPrimaryColor,
                child: InkWell(
                  onTap: () => userId.isNotEmpty
                      ? {
                          BlocProvider.of<HomeTabeBarCubit>(context)
                              .changeIndex(1),
                          Get.offAll(() => const HomeTabScreen()),
                        }
                      : Get.offAll(() => LoginScreen()),
                  child: Image.asset(
                    'assets/images/arrow splash icon.png',
                    scale: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),*/

  void goToHomePage(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
        Timer(
            const Duration(
              // seconds: 1,
              seconds: 3,
            ), () {
          // _bloc.add(AppStarted());
        });
      }
    } on SocketException catch (_) {
      showNetworkErrorDialog(context, () {
        Navigator.of(context).pop();
        Get.to(() {
          loggedIn ? const HomeTabScreen() : const HomeTabScreen();
        });
      });
    }
  }
}
